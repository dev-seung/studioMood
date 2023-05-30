<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/nse_files/js/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>
<body>
	<form name="nse" action="add_db_nse.php" method="post">
		<textarea id="test" class="nse_content"></textarea>		
		<input type="submit" value="전송" onclick="submitContents(this)" />		
	</form>
	<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "test",
				sSkinURI : "/nse_files/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
			function submitContents(elClickedObj) {
				oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다. 
				// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

				try {
					elClickedObj.form.submit();
				} catch (e) {
				}
			}
		</script>
</body>
</html>