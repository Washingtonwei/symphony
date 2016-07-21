<#include "macro-home.ftl">
<#include "../macro-pagination.ftl">
<@home "points">
<#if "adminRole" == currentUser.userRole || currentUser.userName == user.userName || (currentUser.userName != user.userName && user.userPointStatus == 0)>
<table class="points">
    <#list userHomePoints as point>
    <tr<#if point_index % 2 == 1> class="even"</#if>>
        <td class="date">
            ${point.createTime?string('yyyy-MM-dd')} 
            <span class="ft-gray">${point.createTime?string('HH:mm')}</span>
        </td>
        <td class="name">${point.description}</td>
        <td class="balance">${point.balance?c}</td>
    </tr>
    </#list>
</table>

<br>
<@pagination url="/member/${user.userName}/points"/>
<#else>
<p class="ft-center ft-gray home-invisible">${setinvisibleLabel}</p>
</#if>
<#include "../common/ranking.ftl">
</@home>