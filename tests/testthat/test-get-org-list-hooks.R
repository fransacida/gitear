context("get list an organization's webhooks")

# get_org_list_hooks
test_that("The connection to the test url gets a response", {
    skip_on_cran()
    
    base_url <- sub("/$", "", base_url)
    gitea_url <- file.path(base_url, "api/v1", sub("^/", "", "/orgs"), org, 
                           "hooks")
    
    authorization <- paste("token", api_key)
    r <- GET(gitea_url, add_headers(Authorization = authorization),
             accept_json(), config = httr::config(ssl_verifypeer = FALSE))
    
    expect_true(r$status_code %in% c(200, 403, 500))
})

test_that("We geta warning when there is no url", {
    expect_warning(get_org_list_hooks(api_key = api_key, org = org), 
                   "Please add a valid URL")
})

test_that("We geta warning when there is no api_key", {
    expect_warning(get_org_list_hooks(base_url = base_url, org = org), 
                   "Please add a valid API token")
})

test_that("We geta warning when there is no name of organization", {
    expect_warning(get_org_list_hooks(base_url = base_url, api_key = api_key), 
                   "Please add a valid name of the organization")
})

test_that("The list hook is read correctly", {
    test_org_list_hooks <- get_org_list_hooks(base_url, api_key, org)
    expect_true(exists("test_org_list_hooks"))
})

test_that("The calculation of obtaining hook list gives the expected result", {
    value_list_hook <- get_org_list_hooks(base_url, api_key, org)
    expect_equal(TRUE, !is.null(value_list_hook))
    expect_that(value_list_hook, is_a("data.frame"))
    expect_true(nrow(value_list_hook) > 0)
})