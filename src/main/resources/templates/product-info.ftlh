<!DOCTYPE html>
<html>

<head>
    <title>Candy Shop</title>
    <link rel="stylesheet" type="text/css" href="/product-info.css">
</head>

<body>

<h1>Candy Shop</h1><hr>

<a href="/">На главную страницу...</a>

<h4>Подробная информация о товаре</h4>

<#list images as img>
<div>
    <img src="/images/${img.id}"><br>
    <#if user.id = product.user.id || user.isAdmin()>
        <form action="/product/deleteImage/${product.id}/${img.id}" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Удалить фото"/>
            <br><br>
        </form>
    </#if>
</div>
</#list>

<b>Название товара: </b>${product.title}<br>
<b>Описание товара: </b>${product.description}<br>
<b>Цена: </b>${product.price}<br>
<b>Автор: </b> <a href="/user/${product.user.id}">${product.user.name}</a><br>
<hr>

<#if user.id = product.user.id || user.isAdmin()>
    <form action="/product/addimage/${product.id}" method="post" enctype="multipart/form-data">
        Фотография: <input type="file" name="imageFile"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить фото"/>
    </form><hr>
</#if>

<#if user.id = product.user.id || user.isAdmin()>
    <form action="/product/delete/${product.id}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Удалить товар"/>
    </form>
</#if>

</body>

</html>