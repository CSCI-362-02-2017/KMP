#!/bin/bash



cat > KMPs_html.html <<EOF

<!DOCTYPE html>

<html lang="en">

  <head>

    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->



    <!-- Latest compiled and minified CSS -->

    <link

      rel="stylesheet"

      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"

      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"

      crossorigin="anonymous">



    <!-- Optional theme -->

    <link

      rel="stylesheet"

      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"

      integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"

      crossorigin="anonymous">



    <!-- jquery 3, needed for some bootstrap stuff and some simple javascript later on -->

    <script

      src="https://code.jquery.com/jquery-3.2.1.min.js"

      integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="

      crossorigin="anonymous">

    </script>



    <!-- latest minified bootstrap js files -->

    <script

      src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"

      integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"

      crossorigin="anonymous">

    </script>

    <title>KMP</title>

  </head>



  <body>




    <div class="container theme-showcase" role="main">



      <div class="jumbotron">

        <h1>KMP's first script</h1>

      </div>




      <div class="row">

        <div class="col-md-6">

          <table class="table table-striped table-bordered">

            <thead>

              <tr>

                <th>Content of Directory: </th>


              </tr>

            </thead>

            <tbody>

EOF



contents_of_directory=(

$(ls /)

)



for item_name in "${contents_of_directory[@]}"

do



html_snippet="

<tr>

  <td>${item_name}
  </td>
</tr>"



  echo "Html snippet: $html_snippet"



  echo $html_snippet  >> KMPs_html.html

done





cat >> KMPs_html.html <<EOF

            </tbody>

          </table>

        </div>

      </div>



      <div class="well">

        <p>This thing's called a well.</p>

      </div>



    </div>

  </body>

</html>

EOF

