<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>News</title>
</head>
<body>
    <h1>Football News</h1>
    <table>
        <thead>
            <tr>
                <th>Article</th>
                <th>Summary</th>
                <th>Link</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="i" items="${gisa1}" varStatus="status">
                <tr>
                    <td>${i}</td>
                    <td>${gisa2[status.index]}</td>
                    <td><a href="${link[status.index]}">Read more</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <h1>Team Ranking</h1>
    <table>
        <thead>
            <tr>
                <th>Rank</th>
                <th>Team</th>
                <th>Points</th>
                <th>Logo</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="i" items="${rank}" varStatus="status">
                <tr>
                    <td>${i}</td>
                    <td>${teamname[status.index]}</td>
                    <td>${image[status.index]}</td>
                    <td><img src="${image[status.index]}"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
