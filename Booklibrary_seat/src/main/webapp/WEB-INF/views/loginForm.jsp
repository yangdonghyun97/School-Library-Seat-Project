<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center; /* Add this line */
        }

        h1 {
            margin-bottom: 1rem;
            text-align: center;
        }

        hr {
            border: 0;
            height: 1px;
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
            margin-bottom: 1rem;
        }

        form {
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            width: 100%;
            max-width: 400px;
            margin: 0 auto; /* Add this line */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto; /* Add this line */
        }

        td, th {
            padding: 0.5rem;
            text-align: left;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            border: 1px solid #ced4da;
            border-radius: 4px;
            padding: 0.5rem;
        }

        input[type="submit"], button {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            padding: 0.5rem 1rem;
            cursor: pointer;
            margin-top: 1rem;
        }

        button {
            background-color: #6c757d;
            margin-left: 1rem;
        }

        input[type="submit"]:hover, button:hover {
            opacity: 0.9;
        }

    </style>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
</head>
<body>

    <form action="login.do" method="post">
    <h1>로그인</h1>
     <div>${msg }</div>
        <table border="1">
            <tr>
                <td>아이디</td><th><input type="text" name="student_id"></th>
            </tr>
            <tr>
                <td>비밀번호</td><th><input type="password" name="student_pw"></th>
            </tr>
        </table>
        
        <input type="submit" value="로그인"><button type="button" onclick="location.href='checkForm'">회원가입</button>
    </form>
</body>

</html>