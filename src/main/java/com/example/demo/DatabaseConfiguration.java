package com.example.demo;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

//하드코딩(new Sonata())으로 하더라도 스프링으로 부터 객체의 라이프사이클 관리 받으려면
//개발자의 책임을 벗을 수 있어서... 좋아요-제어권을 스프링 컨테이너가 가져갔다. - IoC 
//클래스 선언 앞에 @Configuration을 붙여라 그리고 이른 인스턴스화 하지 않아도 되고
//getter메소드 형태로 객체 주입코드를 선언하고 그 위에 @Bean을 배치함
//필요한 시점(게으른- ApplicationContext)에 객체를 주입해줘서 NullPointerException을 방지
//시점의 문제를 해결해줌 - 대신 어렵다
@Configuration // xml로 설정하는 부분을 담당함 - 어노테이션
// 스프링부트 메이븐방식에서는 application.properties에서 오라클 서버(myBatis)와 관련된 정보를 수집함
@PropertySource("classpath:/application.properties")
// @PropertySource("classpath:/application.yml") - yamul - gradle방식
// 구글에서 코틀린언어를 지원하기로 선언한 후부터 그레이들 방식 선호함
// 메이븐이나 그레이들 방식이거나 모두XXXLogic과 XXXDao 는 동일한 코드를 사용함
// 의존성주입을 하는 방법과 레포를 적용하는 방법의 차이일뿐
// 메이븐 코드를 그레이들 코드에서
// 그레이들코드를 메이븐 코드에서 거의 100% 재사용이 가능함
// @MapperScan(basePackages = "com.example.demo.mapper")
public class DatabaseConfiguration {
	private static final Logger logger = LogManager.getLogger(DatabaseConfiguration.class);

	// @Configuration과 @Bean 은커플이다
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.hikari") // application.properties에 사용되는 속성값 접두어
	public HikariConfig hikariConfig() {// 메소드 리턴타입은 HikariConfig객체임
		return new HikariConfig();// 하드코딩 - 객체 생성- 메모리에 로딩되었다-메소드나 변수를 호출할 수있다.
	}

	// @Bean이 있는 메소드는 객체를 반환하고 객체의 라이프사이클을 스프링 컨테이너가 관리해줌
	// 스프링컨테이너 종류 - BeanFactory(이른), ApplicationContext(아들-게으른)- 누릴게 더 많다 - 가능하면
	// 하위클래스를 상속받자
	@Bean
	public DataSource dataSource() {
		// DataSource DB연동에서 2단계에 해당함
		// Connection con = DriverManager.getConnection(URL, scott,tiger);-의존관계
		// 관리받는다- 자원관리
		DataSource dataSource = new HikariDataSource(hikariConfig());
		logger.info("datasource : {}", dataSource);
		return dataSource;
	}

	// 의존성 주입
	// localhost:9000/WEB-INF/views/qna/qnaList.jsp - 404번
	// RequestDispatcher view =
	// request.getRequestDispatcher("/WEB-INF/views/"+path+".jsp");//404번 아니야
	// 톰캣 컨테이너 내부에서 요청을 하니까 응답이 나간다
	// ApplicationContext를 사용하면 프로젝트 내부에 어디든 갈 수 있어서 위치를 알고 있어서
	// 호출이 가능하다
	// @Bean과 @Autowired 차이점은 뭐죠?
	// 사용자 정의 객체가 아니다. - 스프링코어에 들어있다
	@Autowired
	private ApplicationContext applicationContext = null;// 게으른 컨테이너- 꼭 필요할 때 - 적재적소에
	// Java랑 오라클 서버 사이에서 비벼주는얘 - 젠더
	// SqlSessionFactory가 application.properties 스캔해서 오라클서버 포트번호, IP주소, SCOTT, TIGER
	// 가지고
	// 오라클 서버에 연결통로를 확보한다- 그래야 SELECT문을 보낼 수 있으니까
	// DataSource가 필요하잖아 -
	// 메소드의 파라미터로 객체를 받아오는 것 - pass by value

	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		// SqlSessionFactory는 myBatis.jar제공하고 SqlSessionFactoryBean은
		// mybatis-spring.jar제공하는 객체
		// myBatis가 spring지원을 위해서 제공하는 클래스임
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
		// classpath는 src/main/resourcs이고 해당 쿼리가 있는 xml 위치는 본인의 취향대로 위치키시고 그에 맞도록 설정해주면
		// 된다.
		// 위에서 주입받은 ApplicationContext를 통해서 getResources()호출할 수 있고
		// 파라미터 자리에는 String타입으로 스프링플젝폴더에 관리되고 있는 mapper폴더를 찾아서 그 내부에 추가된 xml파일들의 위치
		// 정보를 갖게된다
		// sqlSessionTemplate을 이용해서 selectList("qnaList"<-qna.xml등록된 id값이니까-> 찾아낼 수
		// 있다->처리해줘)
		// SqlSessionTemplate은 POJO에서 SqlSession과 동일한 역할을 하는 클래스임-
		// mybatis-spring-boot-starter.jar
		// Maven Repository에서 내려 받을 수 있다. - 로컬레포가 아니라 웹 레포이다.
		//
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mapper/**/*.xml"));
		return sqlSessionFactoryBean.getObject();
	}

	// @Bean이 붙은 메소드로 주입받은 객체는 어디서든 사용 가능함
	// 누구에게 의존하고 있나요? SqlSessionFactory지
	// 파라미터 자리는 지변의 자리이다.
	// 지변의 자리는 호출될 때- 결정된다. - null이 아니다 - 뭔가 참조하고 있다. - 메모리에 로딩되었다. - 누릴 수 있다
	// @Autowried
	// private SqlSessionTemplate sqlSessionTemplate = null;//관리받는 방법이다.
	// 절대로 new SqlSessionTemplate()하지 말아라
	// ApplicationContext를 통한 빈관리를 받지 못하지니까
	// 하드코딩{ 직접 인스턴스화하는것}을 했다 하더라도 @Bean붙어있으면 관리 받는 것이다.
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}
