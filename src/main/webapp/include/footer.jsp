<%@ page language="java"		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
    <style>
        body {
            font: bold 18px "malgun gothic";
            margin: 0;
            padding: 0;
            position: relative; 
        }

        .footer {
            position: absolute; 
            bottom: -230px;
            width: 100%;
            background-color: #bebebe;
            color: #ffffff;
            text-align: center;
            padding: 10px 0;
            transition: bottom 0.3s ease;
        }

        .footer.active {
            bottom: 0; 
        }

        .footer p {
            margin: 0;
            font-size: 16px;
        }

        .footer strong {
            font-size: 24px;
            color: #e3dac9;
        }
    </style>
</head>
<body>
    <div class="footer">
        <p>
            <strong>HAPPY STORE</strong>
        </p>
        <p>
            전화번호 : 02-123-4567<br>
            주소 : 서울특별시 금천구 가산디지털2로 95
        </p>
    </div>
    <script>
        window.addEventListener("scroll", function() {
            const footer = document.querySelector(".footer");
            const scrollY = window.scrollY || window.pageYOffset;
            const windowHeight = window.innerHeight;
            const documentHeight = Math.max(
                document.body.scrollHeight,
                document.body.offsetHeight,
                document.documentElement.clientHeight,
                document.documentElement.scrollHeight,
                document.documentElement.offsetHeight
            );
            const footerHeight = footer.offsetHeight;

            if (scrollY + windowHeight >= documentHeight - footerHeight) {
                footer.classList.add("active");
            } else {
                footer.classList.remove("active");
            }
        });
    </script>
</body>
</html>