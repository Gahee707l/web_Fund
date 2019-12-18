<%@ page pageEncoding="utf-8"%>
<%@ page isErrorPage="true"%>
<!-- 기본적으론 못 쓰는데...exception을 쓸 수 있게 됨 -->

error page message : <%= exception.getMessage() %>