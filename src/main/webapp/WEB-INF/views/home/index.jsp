<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class = "box" id = "box">
    <div class="logo">
        <img src="<c:url value="/static/images/bookstore.png" />" />
    </div>
    <div class="search_form">
        <form  v-on:submit.prevent="query()" class="form-wrapper cf">
            <input name="keyword" type="text" v-model="keyword"  placeholder="输入书名..." required/>
            <button type="submit" v-on:click.prevent="query">搜索</button>
        </form>
    </div>
    <div class="showloading">{{loadingText}}</div>
    <div class="search_results" v-if="resultItems.length > 0">
        <ul>
           <li v-for="item in resultItems">
               <div>
                   <a v-bind:href="item.detailUrl" target="_blank"><img v-bind:src="item.imageUrl" /></a>
               </div>
               <div class="shop">{{item.shop.name}}</div>
               <div class="name"><a v-bind:href="item.detailUrl" target="_blank">{{item.name}}</a></div>
               <div class="price">￥{{item.sellPrice}}</div>
           </li>
        </ul>
    </div>
    <div style="clear:both" />
</div>
<script>
    var search = new Vue({
        el: '#box',
        data: {
            keyword: '',
            loadingText: '',
            resultItems: []
        },
        methods: {
            query: function() {
                if($.trim(this.keyword) !== '') {
                    this.loadingText = "查询中...";
                    this.resultItems = [];
                    this.$http.post('search?keyword=' + encodeURI(this.keyword)).then(function(res) {
                        console.log(res.data);
                        this.resultItems = res.data;
                        this.loadingText = "";
                        if(res.data.length == 0) {
                            this.loadingText = "没有找到任何记录。";
                        }
                    });
                }
            }
        }

    });
</script>
