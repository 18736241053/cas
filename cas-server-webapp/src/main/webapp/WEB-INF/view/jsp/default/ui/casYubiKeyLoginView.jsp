<jsp:directive.include file="includes/top.jsp" />
<div class="box fl-panel" id="login">
    <form:form method="post" id="fm1" cssClass="fm-v clearfix"
               commandName="${commandName}" htmlEscape="true">
        <form:errors path="*" id="msg" cssClass="errors" element="div" />
        <div class="row fl-controls-left">
            <spring:message code="screen.welcome.label.netid" />
            <c:if test="${not empty sessionScope.openIdLocalId}">
                <strong>${sessionScope.openIdLocalId}</strong>
                <input type="hidden" id="username" name="username"
                       value="${sessionScope.openIdLocalId}" />
            </c:if>

            <c:if test="${empty sessionScope.openIdLocalId}">
                <strong>
                    <c:out value="${fn:escapeXml(principal.id)}" />
                </strong>

                <form:hidden path="username" value="${principal.id}" />
            </c:if>
        </div>
        <div class="row fl-controls-left">
            <label for="password" class="fl-label"><spring:message code="screen.welcome.label.password" /></label>
            <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
            <form:password cssClass="required" cssErrorClass="error" id="password" size="25" tabindex="1" path="password"
                           accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
            <input  class="btn-submit" name="_eventId_submit" accesskey="l"
                    value="<spring:message code="screen.welcome.button.login" />"
                    tabindex="4" type="submit" />
        </div>
        <div class="row btn-row">
            <input type="hidden" name="execution" value="${flowExecutionKey}"/>
        </div>
    </form:form>
</div>
<jsp:directive.include file="includes/bottom.jsp" />
