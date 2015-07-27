<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="welcomeText">
    Welcome, <span class="welcomeUser"><c:out value="${username}"/></span> <span class="welcomeCustomer">&nbsp;&nbsp;&nbsp;<c:out value="${selectedCustomer}"/></span>
</div>
<div class="tabSeparator">
    <c:if test="${not empty customers}">
    	<c:if test="${gotoHome == 'true'}">
    		<a class="tabLinks" href="goHome">Home</a>
    	</c:if>
    	<c:if test="${goToReportCenter == 'true'}">
    		<a class="tabLinks" href="reportCenter">Report Center</a>
    	</c:if>
        <c:if test="${customers.size() > 1}">
            <a class="tabLinks footerLinks" href="customerSelection">Customer Selection</a>
        </c:if>
        <c:if test="${user.hasAdminAccess()}">
            <a href="goAdmin" target="_blank" class="tabLinks footerLinks">Administration</a>
        </c:if>
        <a class="tabLinks footerLinks" href="passwordReset">Settings</a>
        <a class="tabLinks footerLinks" href="login?logout">Logout</a>
    </c:if>
</div>