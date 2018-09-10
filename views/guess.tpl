<!DOCTYPE html>

<html>
<head>
  <title>Beego</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="shortcut icon" href="/static/img/guess.png" type="image/x-icon" />

  <style type="text/css">
    *,body {
      margin: 0px;
      padding: 0px;
    }

    html,body {
      height: 100%;
    }

    body {
      margin: 0px;
      font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
      font-size: 14px;
      line-height: 20px;
      background-color: #fff;
      display: flex;
      flex-direction: column;
    }

    main {
      display: flex;
      flex-grow: 1;
      flex-direction: column;
      justify-content: center;
      text-align: center;
    }

    a {
      color: #444;
      text-decoration: none;
    }

    label {
      display: block;
    }

    input {
      margin: 10px;
    }

    .img-wrapper {
      margin: 20px 0px;
    }

    .options {
      width: 140px;
      margin: 0 auto;
      text-align: left;
    }

    button {
      margin: 20px 0px;
      padding: 8px 20px;
      border-radius: 6px;
    }

    button.next {
      width: 120px;
    }
  </style>
</head>

<body>
<!--   <header>
  </header> -->
  <main>
    <!-- 处理答题结果 begin -->
    {{if .Next }}
      <div class="img-wrapper">
      {{if .Right}}
          <img src="http://localhost:8080/static/img/c1.jpeg" width=320px>
          <div>
              <button class="next" onclick="location.href='http://localhost:8080/?id={{.Next}}'" type="button">下一个</button>
          </div>
      {{else}}
          <img src="http://localhost:8080/static/img/o1.jpeg" width=320px>
          <div>
              <button class="next" onclick="location.href='http://localhost:8080/?id={{.ID}}'" type="button">再试一次</button>
          </div>
      {{end}}
      </div>


      <!-- 处理答题结果 end -->
    {{else}}
        <div class="img-wrapper">
            <img src="http://localhost:8080{{.Img}}" width="320px">
        </div>

        <form action="http://localhost:8080/" method="POST">
            <div class="options">
            {{range $key, $value := .Option}}
                <label><input type="radio" name="key" value="{{$key}}">{{$value}}</label>
            {{end}}
            </div>

            <button type="submit">go</button>
            <input type="hidden" name="id" value="{{.ID}}">
        </form>
    {{end}}

      <!-- 展示答题信息 begin -->

    <!-- 展示答题信息 end -->

  </main>
  <script src="/static/js/reload.min.js"></script>
</body>
</html>
