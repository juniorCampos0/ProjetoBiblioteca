<%--
  Created by IntelliJ IDEA.
  User: franciso
  Date: 1/27/20
  Time: 9:14 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Books Searched</title>
    <g:external dir="css" file="tabela.css"/>
</head>
<body>
    <TABLE class="my_table">
        <g:each in="${books}" var="book">
            <tr style="border: 1px solid red">
                <td style="border: 1px solid red">
                    ${book.title}
                </td>
                <td style="border: 1px solid red">
                    ${book.subtitle}
                </td>
                <td style="border: 1px solid red">
                    <g:each in="${book.authors}" var="author">
                        ${author.fullName}
                    </g:each>
                </td>
            </tr>
        </g:each>
    </TABLE>
</body>
</html>