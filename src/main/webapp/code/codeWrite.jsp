<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 작성</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #f8f9fa;
    }

    .container {
        max-width: 600px;
        margin: auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
    }

    th {
        background-color: #f0f0f0;
        width: 30%;
    }

    input[type="text"], select {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }

    .btn-area {
        text-align: center;
        margin-top: 20px;
    }

    .btn-area button,
    .btn-area a {
        padding: 10px 20px;
        margin: 0 5px;
        border: none;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
    }

    button[type="submit"] {
        background-color: #007bff;
        color: white;
    }

    button[type="submit"]:hover {
        background-color: #0056b3;
    }

    button[type="reset"] {
        background-color: #6c757d;
        color: white;
    }

    button[type="reset"]:hover {
        background-color: #5a6268;
    }

    .btn-area a {
        background-color: #28a745;
        color: white;
    }

    .btn-area a:hover {
        background-color: #218838;
    }

    @media (max-width: 600px) {
        body {
            padding: 10px;
        }

        table, th, td {
            font-size: 14px;
        }

        .btn-area button,
        .btn-area a {
            font-size: 13px;
            padding: 8px 16px;
            margin: 5px 3px;
        }
    }
</style>
<script>
function fn_submit() {
    if (document.frm.name.value.trim() === "") {
        alert("코드명을 입력하세요.");
        document.frm.name.focus();
        return false;
    }
    document.frm.submit();
}
</script>
</head>
<body>
    <div class="container">
        <h2>코드 등록</h2>
        <form name="frm" method="post" action="codeWriteSave.do">
            <table>
                <tr>
                    <th>분류</th>
                    <td>
                        <select name="gid">
                            <option value="1">Job</option>
                            <option value="2">Hobby</option>
                        </select>
                    </td>				
                </tr>	
                <tr>
                    <th>코드명</th>
                    <td><input type="text" name="name" /></td>	
                </tr>	
            </table>
            <div class="btn-area">
                <button type="submit" onclick="fn_submit(); return false;">저장</button>
                <button type="reset">취소</button>
                <a href="codeList.do">List</a>
            </div>
        </form>
    </div>
</body>
</html>
