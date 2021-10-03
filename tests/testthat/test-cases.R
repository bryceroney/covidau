with_mock_dir("cases", {
  test_that("We can get a user object", {
    act_cases <- cases("ACT")
    expect_identical(names(act_cases), c('date', 'new', 'cases', 'var', 'net', 'state'))
  })
})

