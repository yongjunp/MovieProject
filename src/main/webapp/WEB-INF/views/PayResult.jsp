<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		let payResult = '${payResult}';
		if(payResult == 'Y'){
			/* insert 성공, 결제 성공*/
			/* 부모창에 예매가 되엇습니다!*/
			window.opener.alert('예매되었습니다.');
			window.opener.reserveResult_success();
			
		}else{
			/* insert 성공, 결제 실패*/
			/* 부모창에 예매가 실패하엿습니다.
				delete
			*/
			window.opener.alert('예매 처리에 실패하였습니다.');
			window.opener.reserveResult_fail();
		}
		window.close();
	</script>
	
</body>
</html>