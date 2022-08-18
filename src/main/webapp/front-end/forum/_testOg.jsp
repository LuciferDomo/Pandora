<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
  		<tr>
  			<td>${dataMap.forum.postId}</td>
  			<td>${dataMap.forum.memberId}</td>
  			<td>${dataMap.forum.postTitle}</td>
  			<td>${dataMap.forum.postContent}</td>
  			<td>${dataMap.forum.postTime}</td>
  			<td>${dataMap.forum.clicks}</td>
  			<td>${dataMap.forum.status}</td>
  			<td>${dataMap.comment.commentNo}</td>
  			<td>${dataMap.comment.postId}</td>
  			<td>${dataMap.comment.memberId}</td>
  			<td>${dataMap.comment.commentContent}</td>
  			<td>${dataMap.comment.commentTime}</td>
  			<td>${dataMap.comment.status}</td>
  			<td>${dataMap.comment.englishFirstName}</td>
  		</tr>
  	</table>
  	<img src="/pandora/GetPic?action=forumVOUpdate&postId=${dataMap.forum.postId}">
</body>
</html>