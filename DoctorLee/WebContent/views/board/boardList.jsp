<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{
        box-sizing: border-box;
        border: 1px solid palevioletred;
    }

    #header{
        width: 1800px;
        height: 200px;
    }
    
    section{
        width: 1800px;
        height: 2300px;
    }
    aside{
        width: 300px;
        height: 100%;
        float : left;
        padding-left: 20px;
        padding-right: 20px;
    }
    
    #boardHeader, #boardArticle, #page, #search{
        float: left;
        width: 1400px;
        padding-left: 10px;
        padding-right: 10px;
    }

    #boardHeader{
        height: 100px;
        font-size: 50px;
    }
    #boardArticle{
        height: 1800px;
    }
    #page{
        height: 200px;
    }
    #search{
        height: 200px;
    }
    footer{
        width: 1800px;
        height: 300px;
    }


</style>
</head>
<body>
	
	
    <header id="header">
        헤더 영역
    </header>
    <section>
        <aside>
            사이드 네비
            <%@ include file = "../common/cmNavi.jsp" %>
        </aside>

        <header id="boardHeader">
            게시판 이름
        </header>
        <article id="boardArticle">
            게시판 형태
            <div id="boardContent">
        <table  align="center">
            <thead>
                <tr>
                    <th width="100">게시글 번호</th>
                    <th width="350">제목</th>
                    <th width="150">작성자</th>
                    <th width="150">작성일</th>
                    <th width="100">조회수</th>
                    <th width="100">추천수</th>
                </tr>

                <tbody>
                    <tr>
                        <td colspan="6">조회된 게시글이 없습니다.</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>

            </thead>

        </table>
            </div>
        </article>
        <div id="page">
            페이지바 영역
        </div>
        <div id="search">
            검색 영역
        </div>
        

    </section>
    <footer>
        푸터 영역
    </footer>
    
	


</body>
</html>