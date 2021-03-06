context("version")

# get_version
test_that("The connection to the test url gets a response", {
    skip_on_cran()

    base_url <- sub("/$", "", base_url)
    gitea_url <- file.path(base_url, "api/v1", sub("^/", "", "/version"))

    authorization <- paste("token", api_key)
    r <- GET(gitea_url, add_headers(Authorization = authorization),
             accept_json(), config = httr::config(ssl_verifypeer = FALSE))
    
    expect_true(r$status_code %in% c(200, 403, 500))
})

test_that("We geta warning when there is no url", {
    expect_warning(get_version(api_key = api_key), "Please add a valid URL")
})

test_that("We geta warning when there is no api_key", {
    expect_warning(get_version(base_url = base_url), 
                   "Please add a valid API token")
})

test_that("The version is read correctly", {
    test_version <- get_version(base_url, api_key)
    expect_true(exists("test_version"))
})

test_that("The calculation of obtaining version gives the expected result", {
    value_version <- get_version(base_url, api_key)
    expect_equal(TRUE, !is.null(value_version))
    expect_that(value_version, is_a("data.frame"))
})