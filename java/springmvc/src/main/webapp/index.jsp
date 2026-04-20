<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 重定向到 hello 页面
    response.sendRedirect(request.getContextPath() + "/hello");
%>
