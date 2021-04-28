<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Pizza Plaza</title>
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/main.css">
</head>
<body>

<?php
        $cur_url = $_SERVER['REQUEST_URI'];
        $urls = explode('/', $cur_url); // explode - Breaks the row into substring
        $crumbs = array();

        if (!empty($urls) && $cur_url != '/') {
            foreach($urls as $key => $value){
                $prev_urls = array();
                for ($i = 0; $i <= $key; $i++) {
                    $prev_urls[] = $urls[$i];
                }
                if ($key == count($urls) - 1){
                    $crumbs[$key]['url'] = '';
                }
                elseif (!empty($prev_urls)) {
                    $crumbs[$key]['url'] = count($prev_urls) > 1 ? implode('/', $prev_urls) : '/';
                }
                
                switch ($value) {
                    case '?site=about' : $crumbs[$key]['text'] = 'Uber uns';
                        break;

                    case '?site=contact' : $crumbs[$key]['text'] = 'Kontakt';
                        break;

                    case '?site=imprint' : $crumbs[$key]['text'] = 'Impressum';
                        break;
                    
                    case '?site=online' : $crumbs[$key]['text'] = 'Online ordering';
                        break;

                    default : $crumbs[$key]['text'] = 'Startseite';
                        break;
                }
            }
        }

    ?>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="?site=main">Pizza Plaza</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    
        //error
        <?php if (!empty($crumbs)) { ?>
            <ul class="breadcrumb">
                <?php foreach ($crumbs as $item) { ?>
                    <?php if (isset($item)) { ?>
                        <li>
                            <?php if (!empty($item['url'])) { ?>
                                <a href="<?php echo $item['url'] ?>"><?php echo $item['text'] ?></a>
                            <?php } else { ?>
                                <?php echo $item['text'] ?>
                           <?php } ?>
                        </li>
                    <?php } ?>
                <?php } ?>
            </ul>
        <?php } ?>                
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item <?php if($currentSite === 'main') echo 'active'; ?>">
                <a class="nav-link" href="?site=main">Startseite</a>
            </li>
            <li class="nav-item <?php if($currentSite === 'about') echo 'active'; ?>">
                <a class="nav-link" href="?site=about">&Uuml;ber uns</a>
            </li>
            <li class="nav-item <?php if($currentSite === 'contact') echo 'active'; ?>">
                <a class="nav-link" href="?site=contact">Kontakt</a>
            </li>
            <li class="nav-item <?php if($currentSite === 'imprint') echo 'active'; ?>">
                <a class="nav-link" href="?site=imprint">Impressum</a>
            </li>
            <li class="nav-item <?php if($currentSite === 'online') echo 'active'; ?>">
                <a class="nav-link" href="?site=online">Online ordering</a>
            </li>

        </ul>
    </div>
</nav>

<div class="container">
    <?php include $currentSite . '.php'; ?>
</div>

<script src="node_modules/jquery/dist/jquery.min.js"></script>
<script src="node_modules/popper.js/dist/popper.min.js"></script>
<script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
