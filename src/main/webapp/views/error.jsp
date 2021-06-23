<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    <title>500</title>
    <style>
        .error-page h2 {
            font-size: 100px;
            color: #629aa9;
        }

        .error-page {
            background: #fff;
            padding: 2em 0;
            text-align: center;
            -webkit-box-shadow: 0px 0px 5px -2px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 0px 0px 5px -2px rgba(0, 0, 0, 0.75);
            box-shadow: 0px 0px 5px -2px rgba(0, 0, 0, 0.75);
        }

        form.search-form {
            width: 30%;
            margin: 0 auto;
        }

        .error-page h3 {
            color: #888;
            margin-bottom: 1em;
        }

        .error-page input.form-control {
            height: 36px;
        }

        .error-page h3 i.fa {
            color: #F2B33F;
        }

        .error-page p {
            letter-spacing: 1px;
            width: 40%;
            margin: 30px auto 0;
            line-height: 28px;
            color: #444;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="error-page">
                    <div class="">
                        <h2>500</h2>
                    </div>
                    <div class="">
                        <h3><i class="fa fa-warning text-yellow"></i> Oops! Something Went Wrong.</h3>
                        <p>We could not find the page you were looking for.Please click on back </p>
                        <button type="button" class="btn btn-info btn-lg mt-3"  onclick="GoBackWithRefresh();return false;" style="background-color: #629aa9;">Back</button>

                    </div>
                   
                </div>

            </div>

        </div>



    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>








<script>


function GoBackWithRefresh(event) {
    if ('referrer' in document) {
      
        window.history.back();
       // window.location = document.referrer;
        
    } else {
    	
        window.history.back();
    }
}





</script>
</html>