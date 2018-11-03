<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!Double value;%>
<title>Temperature converter</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, innital-scale=1.0">

</head>
<body>
	<form action="index.jsp">
		<fieldset>
			<legend>
				<b>Skale: Celsjusz [<sup>o</sup>C], Fahrenheit [<sup>o</sup>F], Kelvin
				[K]</b>
			</legend>
			<h1>Przelicznik jednostek miar temperatury</h1>
			<input type="number" name="number" placeholder="podaj liczbe"
				required="required"> 
				<select name="measure">
				<option value="select">wybierz jednostkę temperatury</option>
				<option value="celsjusz">[C] stopień Celsjusz'a</option>
				<option value="fahrenheit">[F] stopień Fahrenheit'a</option>
				<option value="kelvin">Kelvin</option>
			</select> <input type="submit" value="Oblicz"><br>

			<%
				try {
					value = Double.parseDouble(request.getParameter("number"));
					String choice = request.getParameter("measure");
					if (choice.equals("celsjusz")) {
			%>

			<h2 style="color: blue;">
				<%
					out.print(value);
				%>
				[<sup>o</sup>C] to:<br>
				<%
					out.print((value * 1.8) + 32);
				%>
				[<sup>o</sup>F]<br>
				<%
					out.print(value + 273.15);
				%>
				[ K]<br>
			</h2>
			<%
				} else if (choice.equals("fahrenheit")) {
			%>
			<h2 style="color: green;">
				<%
					out.print(value);
				%>
				[<sup>o</sup>F] to:<br>
				<%
					out.print((value - 32) / 1.8);
				%>
				[<sup>o</sup>C]<br>
				<%
					out.print((value + 459.67) * (0.555555555));
				%>
				[ K]<br>
			</h2>
			<%
				} else if (choice.equals("kelvin")) {
			%>
			<h2 style="color: grey;">
				<%
					out.print(value);
				%>
				[ K] to: <br>
				<%
					out.print(value - 273.15);
				%>
				[<sup>o</sup>C]<br>
				<%
					out.print((value * 1.8) - 459.67);
				%>
				[<sup>o</sup>F]<br>
			</h2>

			<%
				} else
			%><h1 style="color: red;">Musisz wybrać jednostkę tempertaury</h1>
			<%
				} catch (Exception ex) {
				}
			%>
		</fieldset>
	</form>
</body>
</html>