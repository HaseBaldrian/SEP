  


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>best_in_place/lib/assets/javascripts/jquery.purr.js at master · bernat/best_in_place · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <link rel="logo" type="image/svg" href="http://github-media-downloads.s3.amazonaws.com/github-logo.svg" />
    <link rel="xhr-socket" href="/_sockets" />


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" />

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="bPuKoM0XatlOJQcopSMwEwpRhITO/idqpc0hG7omw38=" name="csrf-token" />

    <link href="https://a248.e.akamai.net/assets.github.com/assets/github-aacfd01406222a8e32af6bf66a2eed1a08267178.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://a248.e.akamai.net/assets.github.com/assets/github2-30896c5685c3dd8da766a4fd3065a563107c9370.css" media="all" rel="stylesheet" type="text/css" />
    


      <script src="https://a248.e.akamai.net/assets.github.com/assets/frameworks-ec9348b8374c693b0749d0b95b215fe3f5414fd0.js" type="text/javascript"></script>
      <script src="https://a248.e.akamai.net/assets.github.com/assets/github-3a11f3836624f198d32737512fe1c445445987b3.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="bdd56032babb410898471b4229dd697b">

        <link data-pjax-transient rel='permalink' href='/bernat/best_in_place/blob/df178520bf9ba405baee9528d5dbb630d6ff760c/lib/assets/javascripts/jquery.purr.js'>
    <meta property="og:title" content="best_in_place"/>
    <meta property="og:type" content="githubog:gitrepository"/>
    <meta property="og:url" content="https://github.com/bernat/best_in_place"/>
    <meta property="og:image" content="https://secure.gravatar.com/avatar/db5d67928bdd06936660901b7fe6a758?s=420&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"/>
    <meta property="og:site_name" content="GitHub"/>
    <meta property="og:description" content="best_in_place - A RESTful unobtrusive jQuery Inplace-Editor and a helper as a Rails Gem"/>
    <meta property="twitter:card" content="summary"/>
    <meta property="twitter:site" content="@GitHub">
    <meta property="twitter:title" content="bernat/best_in_place"/>

    <meta name="description" content="best_in_place - A RESTful unobtrusive jQuery Inplace-Editor and a helper as a Rails Gem" />


    <meta content="153677" name="octolytics-dimension-user_id" /><meta content="1132186" name="octolytics-dimension-repository_id" />
  <link href="https://github.com/bernat/best_in_place/commits/master.atom" rel="alternate" title="Recent Commits to best_in_place:master" type="application/atom+xml" />

  </head>


  <body class="logged_out page-blob linux vis-public fork env-production  ">
    <div id="wrapper">

      
      
      

      
      <div class="header header-logged-out">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/">Github</a>

    <div class="header-actions">
      <a class="button primary" href="/signup">Sign up</a>
      <a class="button" href="/login?return_to=%2Fbernat%2Fbest_in_place%2Fblob%2Fmaster%2Flib%2Fassets%2Fjavascripts%2Fjquery.purr.js">Sign in</a>
    </div>

    <div class="command-bar js-command-bar  in-repository">


      <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
        <li class="features"><a href="/features">Features</a></li>
          <li class="enterprise"><a href="http://enterprise.github.com/">Enterprise</a></li>
          <li class="blog"><a href="/blog">Blog</a></li>
      </ul>
        <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">
  <a href="/search/advanced" class="advanced-search-icon tooltipped downwards command-bar-search" id="advanced_search" title="Advanced search"><span class="octicon octicon-gear "></span></a>

  <input type="text" data-hotkey="/ s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
      data-repo="bernat/best_in_place"
      data-branch="master"
      data-sha="6ea3d242fe67bf20ccff23c5d623e54eb75b4b13"
  >

    <input type="hidden" name="nwo" value="bernat/best_in_place" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="octicon help tooltipped downwards" title="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

  <div class="divider-vertical"></div>

</form>
    </div>

  </div>
</div>


      


            <div class="site hfeed" itemscope itemtype="http://schema.org/WebPage">
      <div class="hentry">
        
        <div class="pagehead repohead instapaper_ignore readability-menu ">
          <div class="container">
            <div class="title-actions-bar">
              

<ul class="pagehead-actions">



    <li>
      <a href="/login?return_to=%2Fbernat%2Fbest_in_place"
        class="minibutton js-toggler-target star-button entice tooltipped upwards"
        title="You must be signed in to use this feature" rel="nofollow">
        <span class="octicon octicon-star"></span>Star
      </a>
      <a class="social-count js-social-count" href="/bernat/best_in_place/stargazers">
        655
      </a>
    </li>
    <li>
      <a href="/login?return_to=%2Fbernat%2Fbest_in_place"
        class="minibutton js-toggler-target fork-button entice tooltipped upwards"
        title="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-git-branch"></span>Fork
      </a>
      <a href="/bernat/best_in_place/network" class="social-count">
        351
      </a>
    </li>
</ul>

              <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
                <span class="repo-label"><span>public</span></span>
                <span class="mega-octicon octicon-repo"></span>
                <span class="author vcard">
                  <a href="/bernat" class="url fn" itemprop="url" rel="author">
                  <span itemprop="title">bernat</span>
                  </a></span> /
                <strong><a href="/bernat/best_in_place" class="js-current-repository">best_in_place</a></strong>
                  <span class="fork-flag">
                    <span class="text">forked from <a href="/janv/rest_in_place">janv/rest_in_place</a></span>
                  </span>
              </h1>
            </div>

            
  <ul class="tabs">
    <li class="pulse-nav"><a href="/bernat/best_in_place/pulse" class="js-selected-navigation-item " data-selected-links="pulse /bernat/best_in_place/pulse" rel="nofollow"><span class="octicon octicon-pulse"></span></a></li>
    <li><a href="/bernat/best_in_place" class="js-selected-navigation-item selected" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /bernat/best_in_place">Code</a></li>
    <li><a href="/bernat/best_in_place/network" class="js-selected-navigation-item " data-selected-links="repo_network /bernat/best_in_place/network">Network</a></li>
    <li><a href="/bernat/best_in_place/pulls" class="js-selected-navigation-item " data-selected-links="repo_pulls /bernat/best_in_place/pulls">Pull Requests <span class='counter'>9</span></a></li>

      <li><a href="/bernat/best_in_place/issues" class="js-selected-navigation-item " data-selected-links="repo_issues /bernat/best_in_place/issues">Issues <span class='counter'>91</span></a></li>



    <li><a href="/bernat/best_in_place/graphs" class="js-selected-navigation-item " data-selected-links="repo_graphs repo_contributors /bernat/best_in_place/graphs">Graphs</a></li>


  </ul>
  
<div class="tabnav">

  <span class="tabnav-right">
    <ul class="tabnav-tabs">
          <li><a href="/bernat/best_in_place/tags" class="js-selected-navigation-item tabnav-tab" data-selected-links="repo_tags /bernat/best_in_place/tags">Tags <span class="counter ">30</span></a></li>
    </ul>
  </span>

  <div class="tabnav-widget scope">


    <div class="select-menu js-menu-container js-select-menu js-branch-menu">
      <a class="minibutton select-menu-button js-menu-target" data-hotkey="w" data-ref="master">
        <span class="octicon octicon-branch"></span>
        <i>branch:</i>
        <span class="js-select-button">master</span>
      </a>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">

        <div class="select-menu-modal">
          <div class="select-menu-header">
            <span class="select-menu-title">Switch branches/tags</span>
            <span class="octicon octicon-remove-close js-menu-close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-filters">
            <div class="select-menu-text-filter">
              <input type="text" id="commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
            </div>
            <div class="select-menu-tabs">
              <ul>
                <li class="select-menu-tab">
                  <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
                </li>
                <li class="select-menu-tab">
                  <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
                </li>
              </ul>
            </div><!-- /.select-menu-tabs -->
          </div><!-- /.select-menu-filters -->

          <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket css-truncate" data-tab-filter="branches">

            <div data-filterable-for="commitish-filter-field" data-filterable-type="substring">

                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/fix-display-methods/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="fix-display-methods" rel="nofollow" title="fix-display-methods">fix-display-methods</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item selected">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/master/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="master" rel="nofollow" title="master">master</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/rails-3.0/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="rails-3.0" rel="nofollow" title="rails-3.0">rails-3.0</a>
                </div> <!-- /.select-menu-item -->
            </div>

              <div class="select-menu-no-results">Nothing to show</div>
          </div> <!-- /.select-menu-list -->


          <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket css-truncate" data-tab-filter="tags">
            <div data-filterable-for="commitish-filter-field" data-filterable-type="substring">

                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v2.1.0/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.1.0" rel="nofollow" title="v2.1.0">v2.1.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v2.0.3/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.3" rel="nofollow" title="v2.0.3">v2.0.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v2.0.2/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.2" rel="nofollow" title="v2.0.2">v2.0.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v2.0.1/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.1" rel="nofollow" title="v2.0.1">v2.0.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v2.0.0/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.0" rel="nofollow" title="v2.0.0">v2.0.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v1.1.3/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.1.3" rel="nofollow" title="v1.1.3">v1.1.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v1.1.2/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.1.2" rel="nofollow" title="v1.1.2">v1.1.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v1.1.1/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.1.1" rel="nofollow" title="v1.1.1">v1.1.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v1.1.0/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.1.0" rel="nofollow" title="v1.1.0">v1.1.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v1.0.6/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.0.6" rel="nofollow" title="v1.0.6">v1.0.6</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v1.0.5/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.0.5" rel="nofollow" title="v1.0.5">v1.0.5</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v1.0.4/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.0.4" rel="nofollow" title="v1.0.4">v1.0.4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v1.0.3/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.0.3" rel="nofollow" title="v1.0.3">v1.0.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v1.0.2/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.0.2" rel="nofollow" title="v1.0.2">v1.0.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v1.0.1/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.0.1" rel="nofollow" title="v1.0.1">v1.0.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v1.0.0/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.0.0" rel="nofollow" title="v1.0.0">v1.0.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.2.3/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.2.3" rel="nofollow" title="v0.2.3">v0.2.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.2.2/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.2.2" rel="nofollow" title="v0.2.2">v0.2.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.2.1/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.2.1" rel="nofollow" title="v0.2.1">v0.2.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.2.0/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.2.0" rel="nofollow" title="v0.2.0">v0.2.0</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.1.9/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.1.9" rel="nofollow" title="v0.1.9">v0.1.9</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.1.8/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.1.8" rel="nofollow" title="v0.1.8">v0.1.8</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.1.7/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.1.7" rel="nofollow" title="v0.1.7">v0.1.7</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.1.6/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.1.6" rel="nofollow" title="v0.1.6">v0.1.6</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.1.5/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.1.5" rel="nofollow" title="v0.1.5">v0.1.5</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.1.4/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.1.4" rel="nofollow" title="v0.1.4">v0.1.4</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.1.3/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.1.3" rel="nofollow" title="v0.1.3">v0.1.3</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.1.2/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.1.2" rel="nofollow" title="v0.1.2">v0.1.2</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.1.1/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.1.1" rel="nofollow" title="v0.1.1">v0.1.1</a>
                </div> <!-- /.select-menu-item -->
                <div class="select-menu-item js-navigation-item ">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/bernat/best_in_place/blob/v0.1.0/lib/assets/javascripts/jquery.purr.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.1.0" rel="nofollow" title="v0.1.0">v0.1.0</a>
                </div> <!-- /.select-menu-item -->
            </div>

            <div class="select-menu-no-results">Nothing to show</div>

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

  </div> <!-- /.scope -->

  <ul class="tabnav-tabs">
    <li><a href="/bernat/best_in_place" class="selected js-selected-navigation-item tabnav-tab" data-selected-links="repo_source /bernat/best_in_place">Files</a></li>
    <li><a href="/bernat/best_in_place/commits/master" class="js-selected-navigation-item tabnav-tab" data-selected-links="repo_commits /bernat/best_in_place/commits/master">Commits</a></li>
    <li><a href="/bernat/best_in_place/branches" class="js-selected-navigation-item tabnav-tab" data-selected-links="repo_branches /bernat/best_in_place/branches" rel="nofollow">Branches <span class="counter ">3</span></a></li>
  </ul>

</div>

  
  
  


            
          </div>
        </div><!-- /.repohead -->

        <div id="js-repo-pjax-container" class="container context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:51f7323afaf54f07010ece919b3d23b0 -->
<!-- blob contrib frag key: views10/v8/blob_contributors:v21:51f7323afaf54f07010ece919b3d23b0 -->


<div id="slider">
    <div class="frame-meta">

      <p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

        <div class="breadcrumb">
          <span class='bold'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/bernat/best_in_place" class="js-slide-to" data-branch="master" data-direction="back" itemscope="url"><span itemprop="title">best_in_place</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/bernat/best_in_place/tree/master/lib" class="js-slide-to" data-branch="master" data-direction="back" itemscope="url"><span itemprop="title">lib</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/bernat/best_in_place/tree/master/lib/assets" class="js-slide-to" data-branch="master" data-direction="back" itemscope="url"><span itemprop="title">assets</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/bernat/best_in_place/tree/master/lib/assets/javascripts" class="js-slide-to" data-branch="master" data-direction="back" itemscope="url"><span itemprop="title">javascripts</span></a></span><span class="separator"> / </span><strong class="final-path">jquery.purr.js</strong> <span class="js-zeroclipboard zeroclipboard-button" data-clipboard-text="lib/assets/javascripts/jquery.purr.js" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
        </div>

      <a href="/bernat/best_in_place/find/master" class="js-slide-to" data-hotkey="t" style="display:none">Show File Finder</a>


        
  <div class="commit file-history-tease">
    <img class="main-avatar" height="24" src="https://secure.gravatar.com/avatar/2f2bf2c1e07241c0d6e0908b5c05a97c?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
    <span class="author"><a href="/rogercampos" rel="author">rogercampos</a></span>
    <time class="js-relative-date" datetime="2013-02-13T13:53:34-08:00" title="2013-02-13 13:53:34">February 13, 2013</time>
    <div class="commit-title">
        <a href="/bernat/best_in_place/commit/48cffbbdde0c559ba1a502d2900c80bea6d6ebea" class="message">Merge branch 'fix_tests' of git://github.com/leomao10/best_in_place i…</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>3</strong> contributors</a></p>
          <a class="avatar tooltipped downwards" title="rogercampos" href="/bernat/best_in_place/commits/master/lib/assets/javascripts/jquery.purr.js?author=rogercampos"><img height="20" src="https://secure.gravatar.com/avatar/2f2bf2c1e07241c0d6e0908b5c05a97c?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="leomao10" href="/bernat/best_in_place/commits/master/lib/assets/javascripts/jquery.purr.js?author=leomao10"><img height="20" src="https://secure.gravatar.com/avatar/6e9334bf147176953ecf993232b8fd1a?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="pwnall" href="/bernat/best_in_place/commits/master/lib/assets/javascripts/jquery.purr.js?author=pwnall"><img height="20" src="https://secure.gravatar.com/avatar/d7b97642d7aeaf1011ec19e5779144e0?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>


    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2>Users on GitHub who have contributed to this file</h2>
      <ul class="facebox-user-list">
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/2f2bf2c1e07241c0d6e0908b5c05a97c?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/rogercampos">rogercampos</a>
        </li>
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/6e9334bf147176953ecf993232b8fd1a?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/leomao10">leomao10</a>
        </li>
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/d7b97642d7aeaf1011ec19e5779144e0?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/pwnall">pwnall</a>
        </li>
      </ul>
    </div>
  </div>


    </div><!-- ./.frame-meta -->

    <div class="frames">
      <div class="frame" data-permalink-url="/bernat/best_in_place/blob/df178520bf9ba405baee9528d5dbb630d6ff760c/lib/assets/javascripts/jquery.purr.js" data-title="best_in_place/lib/assets/javascripts/jquery.purr.js at master · bernat/best_in_place · GitHub" data-type="blob">

        <div id="files" class="bubble">
          <div class="file">
            <div class="meta">
              <div class="info">
                <span class="icon"><b class="octicon octicon-file-text"></b></span>
                <span class="mode" title="File Mode">file</span>
                  <span>136 lines (117 sloc)</span>
                <span>4.138 kb</span>
              </div>
              <div class="actions">
                <div class="button-group">
                      <a class="minibutton js-entice" href=""
                         data-entice="You must be signed in and on a branch to make or propose changes">Edit</a>
                  <a href="/bernat/best_in_place/raw/master/lib/assets/javascripts/jquery.purr.js" class="button minibutton " id="raw-url">Raw</a>
                    <a href="/bernat/best_in_place/blame/master/lib/assets/javascripts/jquery.purr.js" class="button minibutton ">Blame</a>
                  <a href="/bernat/best_in_place/commits/master/lib/assets/javascripts/jquery.purr.js" class="button minibutton " rel="nofollow">History</a>
                </div><!-- /.button-group -->
              </div><!-- /.actions -->

            </div>
                <div class="blob-wrapper data type-javascript js-blob-data">
      <table class="file-code file-diff">
        <tr class="file-code-line">
          <td class="blob-line-nums">
            <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>
<span id="L88" rel="#L88">88</span>
<span id="L89" rel="#L89">89</span>
<span id="L90" rel="#L90">90</span>
<span id="L91" rel="#L91">91</span>
<span id="L92" rel="#L92">92</span>
<span id="L93" rel="#L93">93</span>
<span id="L94" rel="#L94">94</span>
<span id="L95" rel="#L95">95</span>
<span id="L96" rel="#L96">96</span>
<span id="L97" rel="#L97">97</span>
<span id="L98" rel="#L98">98</span>
<span id="L99" rel="#L99">99</span>
<span id="L100" rel="#L100">100</span>
<span id="L101" rel="#L101">101</span>
<span id="L102" rel="#L102">102</span>
<span id="L103" rel="#L103">103</span>
<span id="L104" rel="#L104">104</span>
<span id="L105" rel="#L105">105</span>
<span id="L106" rel="#L106">106</span>
<span id="L107" rel="#L107">107</span>
<span id="L108" rel="#L108">108</span>
<span id="L109" rel="#L109">109</span>
<span id="L110" rel="#L110">110</span>
<span id="L111" rel="#L111">111</span>
<span id="L112" rel="#L112">112</span>
<span id="L113" rel="#L113">113</span>
<span id="L114" rel="#L114">114</span>
<span id="L115" rel="#L115">115</span>
<span id="L116" rel="#L116">116</span>
<span id="L117" rel="#L117">117</span>
<span id="L118" rel="#L118">118</span>
<span id="L119" rel="#L119">119</span>
<span id="L120" rel="#L120">120</span>
<span id="L121" rel="#L121">121</span>
<span id="L122" rel="#L122">122</span>
<span id="L123" rel="#L123">123</span>
<span id="L124" rel="#L124">124</span>
<span id="L125" rel="#L125">125</span>
<span id="L126" rel="#L126">126</span>
<span id="L127" rel="#L127">127</span>
<span id="L128" rel="#L128">128</span>
<span id="L129" rel="#L129">129</span>
<span id="L130" rel="#L130">130</span>
<span id="L131" rel="#L131">131</span>
<span id="L132" rel="#L132">132</span>
<span id="L133" rel="#L133">133</span>
<span id="L134" rel="#L134">134</span>
<span id="L135" rel="#L135">135</span>

          </td>
          <td class="blob-line-code">
                  <div class="highlight"><pre><div class='line' id='LC1'><span class="cm">/**</span></div><div class='line' id='LC2'><span class="cm"> * jquery.purr.js</span></div><div class='line' id='LC3'><span class="cm"> * Copyright (c) 2008 Net Perspective (net-perspective.com)</span></div><div class='line' id='LC4'><span class="cm"> * Licensed under the MIT License (http://www.opensource.org/licenses/mit-license.php)</span></div><div class='line' id='LC5'><span class="cm"> *</span></div><div class='line' id='LC6'><span class="cm"> * @author R.A. Ray</span></div><div class='line' id='LC7'><span class="cm"> * @projectDescription  jQuery plugin for dynamically displaying unobtrusive messages in the browser. Mimics the behavior of the MacOS program &quot;Growl.&quot;</span></div><div class='line' id='LC8'><span class="cm"> * @version 0.1.0</span></div><div class='line' id='LC9'><span class="cm"> *</span></div><div class='line' id='LC10'><span class="cm"> * @requires jquery.js (tested with 1.2.6)</span></div><div class='line' id='LC11'><span class="cm"> *</span></div><div class='line' id='LC12'><span class="cm"> * @param fadeInSpeed           int - Duration of fade in animation in miliseconds</span></div><div class='line' id='LC13'><span class="cm"> *                          default: 500</span></div><div class='line' id='LC14'><span class="cm"> *  @param fadeOutSpeed         int - Duration of fade out animationin miliseconds</span></div><div class='line' id='LC15'><span class="cm">                            default: 500</span></div><div class='line' id='LC16'><span class="cm"> *  @param removeTimer          int - Timeout, in miliseconds, before notice is removed once it is the top non-sticky notice in the list</span></div><div class='line' id='LC17'><span class="cm">                            default: 4000</span></div><div class='line' id='LC18'><span class="cm"> *  @param isSticky             bool - Whether the notice should fade out on its own or wait to be manually closed</span></div><div class='line' id='LC19'><span class="cm">                            default: false</span></div><div class='line' id='LC20'><span class="cm"> *  @param usingTransparentPNG  bool - Whether or not the notice is using transparent .png images in its styling</span></div><div class='line' id='LC21'><span class="cm">                            default: false</span></div><div class='line' id='LC22'><span class="cm"> */</span></div><div class='line' id='LC23'><br/></div><div class='line' id='LC24'><span class="p">(</span><span class="kd">function</span><span class="p">(</span><span class="nx">jQuery</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC25'><br/></div><div class='line' id='LC26'>&nbsp;&nbsp;<span class="nx">jQuery</span><span class="p">.</span><span class="nx">purr</span> <span class="o">=</span> <span class="kd">function</span><span class="p">(</span><span class="nx">notice</span><span class="p">,</span> <span class="nx">options</span><span class="p">)</span></div><div class='line' id='LC27'>&nbsp;&nbsp;<span class="p">{</span></div><div class='line' id='LC28'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Convert notice to a jQuery object</span></div><div class='line' id='LC29'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">notice</span> <span class="o">=</span> <span class="nx">jQuery</span><span class="p">(</span><span class="nx">notice</span><span class="p">);</span></div><div class='line' id='LC30'><br/></div><div class='line' id='LC31'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Add a class to denote the notice as not sticky</span></div><div class='line' id='LC32'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">notice</span><span class="p">.</span><span class="nx">addClass</span><span class="p">(</span><span class="s1">&#39;purr&#39;</span><span class="p">);</span></div><div class='line' id='LC33'><br/></div><div class='line' id='LC34'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Get the container element from the page</span></div><div class='line' id='LC35'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">cont</span> <span class="o">=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">getElementById</span><span class="p">(</span><span class="s1">&#39;purr-container&#39;</span><span class="p">);</span></div><div class='line' id='LC36'><br/></div><div class='line' id='LC37'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// If the container doesn&#39;t yet exist, we need to create it</span></div><div class='line' id='LC38'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="nx">cont</span><span class="p">)</span></div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">{</span></div><div class='line' id='LC40'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">cont</span> <span class="o">=</span> <span class="s1">&#39;&lt;div id=&quot;purr-container&quot;&gt;&lt;/div&gt;&#39;</span><span class="p">;</span></div><div class='line' id='LC41'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC42'><br/></div><div class='line' id='LC43'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Convert cont to a jQuery object</span></div><div class='line' id='LC44'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">cont</span> <span class="o">=</span> <span class="nx">jQuery</span><span class="p">(</span><span class="nx">cont</span><span class="p">);</span></div><div class='line' id='LC45'><br/></div><div class='line' id='LC46'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Add the container to the page</span></div><div class='line' id='LC47'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">jQuery</span><span class="p">(</span><span class="s1">&#39;body&#39;</span><span class="p">).</span><span class="nx">append</span><span class="p">(</span><span class="nx">cont</span><span class="p">);</span></div><div class='line' id='LC48'><br/></div><div class='line' id='LC49'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">notify</span><span class="p">();</span></div><div class='line' id='LC50'><br/></div><div class='line' id='LC51'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">function</span> <span class="nx">notify</span> <span class="p">()</span></div><div class='line' id='LC52'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">{</span></div><div class='line' id='LC53'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Set up the close button</span></div><div class='line' id='LC54'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">close</span> <span class="o">=</span> <span class="nb">document</span><span class="p">.</span><span class="nx">createElement</span><span class="p">(</span><span class="s1">&#39;a&#39;</span><span class="p">);</span></div><div class='line' id='LC55'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">jQuery</span><span class="p">(</span><span class="nx">close</span><span class="p">).</span><span class="nx">attr</span><span class="p">({</span></div><div class='line' id='LC56'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">className</span><span class="o">:</span> <span class="s1">&#39;close&#39;</span><span class="p">,</span></div><div class='line' id='LC57'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">href</span><span class="o">:</span> <span class="s1">&#39;#close&#39;</span></div><div class='line' id='LC58'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}).</span><span class="nx">appendTo</span><span class="p">(</span><span class="nx">notice</span><span class="p">).</span><span class="nx">click</span><span class="p">(</span><span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC59'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">removeNotice</span><span class="p">();</span></div><div class='line' id='LC60'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="kc">false</span><span class="p">;</span></div><div class='line' id='LC61'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">});</span></div><div class='line' id='LC62'><br/></div><div class='line' id='LC63'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// If ESC is pressed remove notice</span></div><div class='line' id='LC64'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">jQuery</span><span class="p">(</span><span class="nb">document</span><span class="p">).</span><span class="nx">keyup</span><span class="p">(</span><span class="kd">function</span><span class="p">(</span><span class="nx">e</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC65'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">keyCode</span> <span class="o">===</span> <span class="mi">27</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC66'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">removeNotice</span><span class="p">();</span></div><div class='line' id='LC67'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC68'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">});</span></div><div class='line' id='LC69'><br/></div><div class='line' id='LC70'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Add the notice to the page and keep it hidden initially</span></div><div class='line' id='LC71'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">notice</span><span class="p">.</span><span class="nx">appendTo</span><span class="p">(</span><span class="nx">cont</span><span class="p">).</span><span class="nx">hide</span><span class="p">();</span></div><div class='line' id='LC72'><br/></div><div class='line' id='LC73'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">//Fade in the notice we just added</span></div><div class='line' id='LC74'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">notice</span><span class="p">.</span><span class="nx">fadeIn</span><span class="p">(</span><span class="nx">options</span><span class="p">.</span><span class="nx">fadeInSpeed</span><span class="p">);</span></div><div class='line' id='LC75'><br/></div><div class='line' id='LC76'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Set up the removal interval for the added notice if that notice is not a sticky</span></div><div class='line' id='LC77'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="nx">options</span><span class="p">.</span><span class="nx">isSticky</span><span class="p">)</span></div><div class='line' id='LC78'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">{</span></div><div class='line' id='LC79'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">topSpotInt</span> <span class="o">=</span> <span class="nx">setInterval</span><span class="p">(</span><span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC80'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Check to see if our notice is the first non-sticky notice in the list</span></div><div class='line' id='LC81'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">notice</span><span class="p">.</span><span class="nx">prevAll</span><span class="p">(</span><span class="s1">&#39;.purr&#39;</span><span class="p">).</span><span class="nx">length</span> <span class="o">===</span> <span class="mi">0</span><span class="p">)</span></div><div class='line' id='LC82'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">{</span></div><div class='line' id='LC83'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Stop checking once the condition is met</span></div><div class='line' id='LC84'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">clearInterval</span><span class="p">(</span><span class="nx">topSpotInt</span><span class="p">);</span></div><div class='line' id='LC85'><br/></div><div class='line' id='LC86'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Call the close action after the timeout set in options</span></div><div class='line' id='LC87'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">setTimeout</span><span class="p">(</span><span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC88'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">removeNotice</span><span class="p">();</span></div><div class='line' id='LC89'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">},</span> <span class="nx">options</span><span class="p">.</span><span class="nx">removeTimer</span><span class="p">);</span></div><div class='line' id='LC90'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC91'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">},</span> <span class="mi">200</span><span class="p">);</span></div><div class='line' id='LC92'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC93'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC94'><br/></div><div class='line' id='LC95'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">function</span> <span class="nx">removeNotice</span><span class="p">()</span></div><div class='line' id='LC96'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">{</span></div><div class='line' id='LC97'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Fade the object out before reducing its height to produce the sliding effect</span></div><div class='line' id='LC98'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">notice</span><span class="p">.</span><span class="nx">animate</span><span class="p">({</span> <span class="nx">opacity</span><span class="o">:</span> <span class="s1">&#39;0&#39;</span> <span class="p">},</span></div><div class='line' id='LC99'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">{</span></div><div class='line' id='LC100'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">duration</span><span class="o">:</span> <span class="nx">options</span><span class="p">.</span><span class="nx">fadeOutSpeed</span><span class="p">,</span></div><div class='line' id='LC101'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">complete</span><span class="o">:</span> <span class="kd">function</span> <span class="p">()</span></div><div class='line' id='LC102'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">{</span></div><div class='line' id='LC103'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">notice</span><span class="p">.</span><span class="nx">animate</span><span class="p">({</span> <span class="nx">height</span><span class="o">:</span> <span class="s1">&#39;0px&#39;</span> <span class="p">},</span></div><div class='line' id='LC104'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">{</span></div><div class='line' id='LC105'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">duration</span><span class="o">:</span> <span class="nx">options</span><span class="p">.</span><span class="nx">fadeOutSpeed</span><span class="p">,</span></div><div class='line' id='LC106'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">complete</span><span class="o">:</span> <span class="kd">function</span><span class="p">()</span></div><div class='line' id='LC107'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">{</span></div><div class='line' id='LC108'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">notice</span><span class="p">.</span><span class="nx">remove</span><span class="p">();</span></div><div class='line' id='LC109'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC110'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC111'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">);</span></div><div class='line' id='LC112'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC113'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC114'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">);</span></div><div class='line' id='LC115'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">};</span></div><div class='line' id='LC116'>&nbsp;&nbsp;<span class="p">};</span></div><div class='line' id='LC117'><br/></div><div class='line' id='LC118'>&nbsp;&nbsp;<span class="nx">jQuery</span><span class="p">.</span><span class="nx">fn</span><span class="p">.</span><span class="nx">purr</span> <span class="o">=</span> <span class="kd">function</span><span class="p">(</span><span class="nx">options</span><span class="p">)</span></div><div class='line' id='LC119'>&nbsp;&nbsp;<span class="p">{</span></div><div class='line' id='LC120'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">options</span> <span class="o">=</span> <span class="nx">options</span> <span class="o">||</span> <span class="p">{};</span></div><div class='line' id='LC121'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">options</span><span class="p">.</span><span class="nx">fadeInSpeed</span> <span class="o">=</span> <span class="nx">options</span><span class="p">.</span><span class="nx">fadeInSpeed</span> <span class="o">||</span> <span class="mi">500</span><span class="p">;</span></div><div class='line' id='LC122'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">options</span><span class="p">.</span><span class="nx">fadeOutSpeed</span> <span class="o">=</span> <span class="nx">options</span><span class="p">.</span><span class="nx">fadeOutSpeed</span> <span class="o">||</span> <span class="mi">500</span><span class="p">;</span></div><div class='line' id='LC123'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">options</span><span class="p">.</span><span class="nx">removeTimer</span> <span class="o">=</span> <span class="nx">options</span><span class="p">.</span><span class="nx">removeTimer</span> <span class="o">||</span> <span class="mi">4000</span><span class="p">;</span></div><div class='line' id='LC124'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">options</span><span class="p">.</span><span class="nx">isSticky</span> <span class="o">=</span> <span class="nx">options</span><span class="p">.</span><span class="nx">isSticky</span> <span class="o">||</span> <span class="kc">false</span><span class="p">;</span></div><div class='line' id='LC125'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">options</span><span class="p">.</span><span class="nx">usingTransparentPNG</span> <span class="o">=</span> <span class="nx">options</span><span class="p">.</span><span class="nx">usingTransparentPNG</span> <span class="o">||</span> <span class="kc">false</span><span class="p">;</span></div><div class='line' id='LC126'><br/></div><div class='line' id='LC127'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">each</span><span class="p">(</span><span class="kd">function</span><span class="p">()</span></div><div class='line' id='LC128'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">{</span></div><div class='line' id='LC129'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">new</span> <span class="nx">jQuery</span><span class="p">.</span><span class="nx">purr</span><span class="p">(</span> <span class="k">this</span><span class="p">,</span> <span class="nx">options</span> <span class="p">);</span></div><div class='line' id='LC130'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC131'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">);</span></div><div class='line' id='LC132'><br/></div><div class='line' id='LC133'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="k">this</span><span class="p">;</span></div><div class='line' id='LC134'>&nbsp;&nbsp;<span class="p">};</span></div><div class='line' id='LC135'><span class="p">})(</span> <span class="nx">jQuery</span> <span class="p">);</span></div></pre></div>
          </td>
        </tr>
      </table>
  </div>

          </div>
        </div>

        <a href="#jump-to-line" rel="facebox" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
        <div id="jump-to-line" style="display:none">
          <h2>Jump to Line</h2>
          <form accept-charset="UTF-8" class="js-jump-to-line-form">
            <input class="textfield js-jump-to-line-field" type="text">
            <div class="full-button">
              <button type="submit" class="button">Go</button>
            </div>
          </form>
        </div>

      </div>
    </div>
</div>

<div id="js-frame-loading-template" class="frame frame-loading large-loading-area" style="display:none;">
  <img class="js-frame-loading-spinner" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-128.gif?1347543527" height="64" width="64">
</div>


        </div>
      </div>
      <div class="modal-backdrop"></div>
    </div>

      <div id="footer-push"></div><!-- hack for sticky footer -->
    </div><!-- end of wrapper - hack for sticky footer -->

      <!-- footer -->
      <div id="footer">
  <div class="container clearfix">

      <dl class="footer_nav">
        <dt>GitHub</dt>
        <dd><a href="/about">About us</a></dd>
        <dd><a href="/blog">Blog</a></dd>
        <dd><a href="/contact">Contact &amp; support</a></dd>
        <dd><a href="http://enterprise.github.com/">GitHub Enterprise</a></dd>
        <dd><a href="http://status.github.com/">Site status</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Applications</dt>
        <dd><a href="http://mac.github.com/">GitHub for Mac</a></dd>
        <dd><a href="http://windows.github.com/">GitHub for Windows</a></dd>
        <dd><a href="http://eclipse.github.com/">GitHub for Eclipse</a></dd>
        <dd><a href="http://mobile.github.com/">GitHub mobile apps</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Services</dt>
        <dd><a href="http://get.gaug.es/">Gauges: Web analytics</a></dd>
        <dd><a href="http://speakerdeck.com">Speaker Deck: Presentations</a></dd>
        <dd><a href="https://gist.github.com">Gist: Code snippets</a></dd>
        <dd><a href="http://jobs.github.com/">Job board</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Documentation</dt>
        <dd><a href="http://help.github.com/">GitHub Help</a></dd>
        <dd><a href="http://developer.github.com/">Developer API</a></dd>
        <dd><a href="http://github.github.com/github-flavored-markdown/">GitHub Flavored Markdown</a></dd>
        <dd><a href="http://pages.github.com/">GitHub Pages</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>More</dt>
        <dd><a href="http://training.github.com/">Training</a></dd>
        <dd><a href="/edu">Students &amp; teachers</a></dd>
        <dd><a href="http://shop.github.com">The Shop</a></dd>
        <dd><a href="/plans">Plans &amp; pricing</a></dd>
        <dd><a href="http://octodex.github.com/">The Octodex</a></dd>
      </dl>

      <hr class="footer-divider">


    <p class="right">&copy; 2013 <span title="0.09110s from fe18.rs.github.com">GitHub</span>, Inc. All rights reserved.</p>
    <a class="left" href="/">
      <span class="mega-octicon octicon-mark-github"></span>
    </a>
    <ul id="legal">
        <li><a href="/site/terms">Terms of Service</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
    </ul>

  </div><!-- /.container -->

</div><!-- /.#footer -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/bernat/best_in_place/suggestions/commit">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" title="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      title="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      Something went wrong with that request. Please try again.
      <a href="#" class="octicon octicon-remove-close ajax-error-dismiss"></a>
    </div>

    
    <span id='server_response_time' data-time='0.09144' data-host='fe18'></span>
    
  </body>
</html>

