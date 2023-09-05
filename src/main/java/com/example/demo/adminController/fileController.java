package com.example.demo.adminController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.adminDao.fileinsertDao;

import org.springframework.util.StringUtils;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequestWrapper;

@RequestMapping("/file/*")
@Controller
public class fileController
{

	@Autowired
	private fileinsertDao fileinsertDao;

	@PostMapping("Insert")
	public String uploadFileWithParams(@RequestParam Map<String, String> params,
			@RequestParam("file") MultipartFile file)
	{

		// 올린 파일 이름
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		// 실제 저장 폴더 경로
		String projectPath = "C:\\Users\\godbu\\Desktop\\returnHappy\\src\\main\\webapp\\images";
		// 저장할 파일객체의 생성자를 통해 정보를 넣어준다 (저장폴더경로, 저장할 파일이름)
		File dest = new File(projectPath, fileName);

		try
		{
			// 폴더에 파일을 저장하는 메소드
			file.transferTo(dest);

			// db에 보낼 경로값
			String filePath = "/images/" + fileName;

			// db에 저장될 이미지 경로값을 map파라미터에 담겨서 쿼리문으로 넘긴다.
			params.put("file_path", filePath);
			// 삽입을 해준다.
			int result = fileinsertDao.Insert(params);
		}

		catch (IllegalStateException | IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 업로드 완료 후 리다이렉트
		return "redirect:/file/Check";

	}


	@GetMapping("Check")
	public String Check(Model model)
	{
		List<Map<String, Object>> fList = fileinsertDao.Check();
		model.addAttribute("fList", fList);
		return "forward:/file/fileCheck.jsp";

	}

}