<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::농작물이야기</title>
    <link rel="stylesheet" href="/farmstory/css/style.css"/>
    <style>
    /* 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        font-size: 14px;
    }

    table th, table td {
        padding: 10px;
        text-align: left;
        vertical-align: middle;
    }

    table th {
        background-color: #f7f7f7;
        font-weight: bold;
        color: #333;
        border-bottom: 2px solid #e1e1e1;
        border-top: 3px solid #333; /* 위쪽에 검은색 선 추가 */
    }

    table th:first-child, table td:first-child {
        width: 50px;
        text-align: center;
    }

    table th:nth-child(2), table td:nth-child(2) {
        width: 60%;
    }

    table th:nth-child(3), table td:nth-child(3),
    table th:nth-child(4), table td:nth-child(4),
    table th:nth-child(5), table td:nth-child(5) {
        width: 10%;
        text-align: center;
    }

    table th + th, table td + td {
        border-left: 1px solid #ccc;
    }

    table tbody tr:hover {
        background-color: #f9f9f9;
    }

    table td a {
        text-decoration: none;
        color: #333;
    }

    table td a:hover {
        color: #d9534f;
    }

    /* 검색 바 스타일 */
    .search-bar {
        margin: 10px 0;
        padding: 10px;
        background-color: #f7f7f7;
        border: 1px solid #e1e1e1;
        text-align: center;
    }

    .search-bar form {
        display: inline-flex;
        align-items: center;
        justify-content: center;
    }

    .search-bar select{
        padding: 5px;
        border: 1px solid #ccc;
        margin-right: 5px;
        width: 100px; /* 가로 길이를 늘림 */
    }
    
    .search-bar input[type="text"] {
        padding: 5px;
        border: 1px solid #ccc;
        margin-right: 5px;
        width: 150px; /* 가로 길이를 늘림 */
    }

    .search-bar input[type="submit"] {
        padding: 5px 10px;
        background-color: #333;
        color: #fff;
        border: none;
        cursor: pointer;
    }

    .search-bar input[type="submit"]:hover {
        background-color: #d9534f;
    }

    .search-bar input[type="radio"] {
        margin-left: 10px;
    }

    /* Total 표시 스타일 */
    .total-count {
        text-align: right;
        margin-bottom: 10px;
        font-weight: bold;
        font-size: 14px;
    }
</style>
</head>
<body>
    <div id="container">
        <header>
            <a href="/farmstory/index.html" class="logo"><img src="/farmstory/images/logo.png" alt="로고"/></a>
            <p>
                <a href="#">HOME |</a>
                <a href="#">로그인 |</a>
                <a href="#">회원가입 |</a>
                <a href="#">고객센터</a>
            </p>
            <img src="/farmstory/images/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li><a href="#">팜스토리소개</a></li>
                <li><a href="#"><img src="/farmstory/images/head_menu_badge.png" alt="30%"/>장바구니</a></li>
                <li><a href="#">농작물이야기</a></li>
                <li><a href="#">이벤트</a></li>
                <li><a href="#">커뮤니티</a></li>
            </ul>
        </header>

        <div id="sub">
            <div><img src="/farmstory/images/sub_top_tit3.png" alt="CROP TALK"></div>
            <section class="croptalk">
                <aside>
                    <img src="/farmstory/images/sub_aside_cate3_tit.png" alt="농작물이야기"/>

                    <ul class="lnb">
                        <li class="on"><a href="list.jsp">농작물이야기</a></li>
                        <li><a href="grow.jsp">텃밭가꾸기</a></li>
                        <li><a href="school.jsp">귀농학교</a></li>
                    </ul>
                </aside>
                <article>
                    <nav>
                        <img src="/farmstory/images/sub_nav_tit_cate3_tit1.png" alt="농작물이야기"/>
                        <p>
                            HOME > 농작물이야기 > <em>농작물이야기</em>
                        </p>
                    </nav>

                    <!-- Total과 게시판 목록 시작 -->
                    <div class="total-count">
                        Total: ${articles.size()}
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>날짜</th>
                                <th>조회</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="article" items="${articles}">
                                <tr>
                                    <td>${article.id}</td>
                                    <td><a href="view.jsp?id=${article.id}">${article.title}</a></td>
                                    <td>${article.writer}</td>
                                    <td>${article.createdAt}</td>
                                    <td>${article.views}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- 게시판 목록 끝 -->

                    <!-- 검색 창 -->
                    <div class="search-bar">
                        <form action="search.jsp" method="get">
                            <select name="searchField">
                                <option value="title">제목</option>
                                <option value="writer">글쓴이</option>
                            </select>
                            <input type="text" name="searchQuery" placeholder="검색어 입력">
                            <input type="submit" value="검색">
                            <input type="radio" name="searchOption" value="and" checked> and
                            <input type="radio" name="searchOption" value="or"> or
                        </form>
                    </div>

                </article>
            </section>
        </div>

        <footer>
            <img src="/farmstory/images/footer_logo.png" alt="로고"/>
            <p>
                (주)팜스토리 / 사업자등록번호 123-45-67890 / 통신판매업신고 제 2013-팜스토리구-123호 / 벤처기업확인 서울지방중소기업청 제 012345678-9-01234호<br />
                등록번호 팜스토리01234 (2013.04.01) / 발행인 : 홍길동<br />
                대표 : 홍길동 / 이메일 : email@mail.mail / 전화 : 01) 234-5678 / 경기도 성남시 잘한다구 신난다동 345<br />
                <em>Copyright(C)홍길동 All rights reserved.</em>
            </p>
        </footer>
    </div>    
</body>
</html>
