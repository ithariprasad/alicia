<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="date" class="java.util.Date" />

<footer class="footer">
    <div class="container">
        <p class="footer-text-center text-muted">&copy; <fmt:formatDate value="${date}" pattern="yyyy" /> Virtusa Corporation. &nbsp;</p>
    </div>
</footer>