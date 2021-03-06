context("test-rwhatsapp")

history <- system.file("extdata", "sample.txt", package = "rwhatsapp")
converted <- structure(c(1499898922.226, 1499937164.226),
                       tzone = "GMT",
                       class = c("POSIXct",
                                 "POSIXt"))

test_that("time is converted correctly", {
  # standard
  # dd.MM.yyyy, hh:mm:ss a
  expect_equal(
    rwa_read(txt = c(
      "12.07.2017, 10:35:22 PM - Johannes Gruber: Was it good?",
      "13.07.2017, 09:12:44 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5 # 5 seconds tolerance
  )
  # dd.MM.yyyy, hh:mm a
  expect_equal(
    rwa_read(txt = c(
      "12.07.2017, 10:35 PM - Johannes Gruber: Was it good?",
      "13.07.2017, 09:12 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60 # 60 seconds tolerance
  )
  # dd.MM.yyyy, HH:mm:ss
  expect_equal(
    rwa_read(txt = c(
      "12.07.2017, 22:35:22 - Johannes Gruber: Was it good?",
      "13.07.2017, 09:12:44 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # dd.MM.yyyy, HH:mm
  expect_equal(
    rwa_read(txt = c(
      "12.07.2017, 22:35 - Johannes Gruber: Was it good?",
      "13.07.2017, 09:12 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # MM.dd.yyyy, hh:mm:ss a
  expect_equal(
    rwa_read(txt = c(
      "07.12.2017, 10:35:22 PM - Johannes Gruber: Was it good?",
      "07.13.2017, 09:12:44 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # MM.dd.yyyy, hh:mm a
  expect_equal(
    rwa_read(txt = c(
      "07.12.2017, 10:35 PM - Johannes Gruber: Was it good?",
      "07.13.2017, 09:12 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # MM.dd.yyyy, HH:mm:ss
  expect_equal(
    rwa_read(txt = c(
      "07.12.2017, 22:35:22 - Johannes Gruber: Was it good?",
      "07.13.2017, 09:12:44 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # MM.dd.yyyy, HH:mm
  expect_equal(
    rwa_read(txt = c(
      "07.12.2017, 22:35 - Johannes Gruber: Was it good?",
      "07.13.2017, 09:12 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  ##### two-digit year
  # dd.MM.yy, hh:mm:ss a
  expect_equal(
    rwa_read(txt = c(
      "12.07.17, 10:35:22 PM - Johannes Gruber: Was it good?",
      "13.07.17, 09:12:44 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # dd.MM.yy, hh:mm a
  expect_equal(
    rwa_read(txt = c(
      "12.07.17, 10:35 PM - Johannes Gruber: Was it good?",
      "13.07.17, 09:12 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # dd.MM.yy, HH:mm:ss
  expect_equal(
    rwa_read(txt = c(
      "12.07.17, 22:35:22 - Johannes Gruber: Was it good?",
      "13.07.17, 09:12:44 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # dd.MM.yy, HH:mm
  expect_equal(
    rwa_read(txt = c(
      "12.07.17, 22:35 - Johannes Gruber: Was it good?",
      "13.07.17, 09:12 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # MM.dd.yy, hh:mm:ss a
  expect_equal(
    rwa_read(txt = c(
      "07.12.17, 10:35:22 PM - Johannes Gruber: Was it good?",
      "07.13.17, 09:12:44 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # MM.dd.yy, hh:mm a
  expect_equal(
    rwa_read(txt = c(
      "07.12.17, 10:35 PM - Johannes Gruber: Was it good?",
      "07.13.17, 09:12 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # MM.dd.yy, HH:mm:ss
  expect_equal(
    rwa_read(txt = c(
      "07.12.17, 22:35:22 - Johannes Gruber: Was it good?",
      "07.13.17, 09:12:44 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # MM.dd.yy, HH:mm
  expect_equal(
    rwa_read(txt = c(
      "07.12.17, 22:35 - Johannes Gruber: Was it good?",
      "07.13.17, 09:12 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  ##### /
  # dd/MM/yyyy, hh:mm:ss a
  expect_equal(
    rwa_read(txt = c(
      "12/07/2017, 10:35:22 PM - Johannes Gruber: Was it good?",
      "13/07/2017, 09:12:44 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # dd/MM/yyyy, hh:mm a
  expect_equal(
    rwa_read(txt = c(
      "12/07/2017, 10:35 PM - Johannes Gruber: Was it good?",
      "13/07/2017, 09:12 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # dd/MM/yyyy, HH:mm:ss
  expect_equal(
    rwa_read(txt = c(
      "12/07/2017, 22:35:22 - Johannes Gruber: Was it good?",
      "13/07/2017, 09:12:44 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # dd/MM/yyyy, HH:mm
  expect_equal(
    rwa_read(txt = c(
      "12/07/2017, 22:35 - Johannes Gruber: Was it good?",
      "13/07/2017, 09:12 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # MM/dd/yyyy, hh:mm:ss a
  expect_equal(
    rwa_read(txt = c(
      "07/12/2017, 10:35:22 PM - Johannes Gruber: Was it good?",
      "07/13/2017, 09:12:44 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # MM/dd/yyyy, hh:mm a
  expect_equal(
    rwa_read(txt = c(
      "07/12/2017, 10:35 PM - Johannes Gruber: Was it good?",
      "07/13/2017, 09:12 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # MM/dd/yyyy, HH:mm:ss
  expect_equal(
    rwa_read(txt = c(
      "07/12/2017, 22:35:22 - Johannes Gruber: Was it good?",
      "07/13/2017, 09:12:44 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # MM/dd/yyyy, HH:mm
  expect_equal(
    rwa_read(txt = c(
      "07/12/2017, 22:35 - Johannes Gruber: Was it good?",
      "07/13/2017, 09:12 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  ##### / + two-digit year
  # dd/MM/yy, hh:mm:ss a
  expect_equal(
    rwa_read(txt = c(
      "12/07/17, 10:35:22 PM - Johannes Gruber: Was it good?",
      "13/07/17, 09:12:44 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # dd/MM/yy, hh:mm a
  expect_equal(
    rwa_read(txt = c(
      "12/07/17, 10:35 PM - Johannes Gruber: Was it good?",
      "13/07/17, 09:12 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # dd/MM/yy, HH:mm:ss
  expect_equal(
    rwa_read(txt = c(
      "12/07/17, 22:35:22 - Johannes Gruber: Was it good?",
      "13/07/17, 09:12:44 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # dd/MM/yy, HH:mm
  expect_equal(
    rwa_read(txt = c(
      "12/07/17, 22:35 - Johannes Gruber: Was it good?",
      "13/07/17, 09:12 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # MM/dd/yy, hh:mm:ss a
  expect_equal(
    rwa_read(txt = c(
      "07/12/17, 10:35:22 PM - Johannes Gruber: Was it good?",
      "07/13/17, 09:12:44 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # MM/dd/yy, hh:mm a
  expect_equal(
    rwa_read(txt = c(
      "07/12/17, 10:35 PM - Johannes Gruber: Was it good?",
      "07/13/17, 09:12 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # MM/dd/yy, HH:mm:ss
  expect_equal(
    rwa_read(txt = c(
      "07/12/17, 22:35:22 - Johannes Gruber: Was it good?",
      "07/13/17, 09:12:44 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # MM/dd/yy, HH:mm
  expect_equal(
    rwa_read(txt = c(
      "07/12/17, 22:35 - Johannes Gruber: Was it good?",
      "07/13/17, 09:12 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  ##### -
  # dd-MM-yyyy, hh:mm:ss a
  expect_equal(
    rwa_read(txt = c(
      "12-07-2017, 10:35:22 PM - Johannes Gruber: Was it good?",
      "13-07-2017, 09:12:44 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # dd-MM-yyyy, hh:mm a
  expect_equal(
    rwa_read(txt = c(
      "12-07-2017, 10:35 PM - Johannes Gruber: Was it good?",
      "13-07-2017, 09:12 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # dd-MM-yyyy, HH:mm:ss
  expect_equal(
    rwa_read(txt = c(
      "12-07-2017, 22:35:22 - Johannes Gruber: Was it good?",
      "13-07-2017, 09:12:44 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # dd-MM-yyyy, HH:mm
  expect_equal(
    rwa_read(txt = c(
      "12-07-2017, 22:35 - Johannes Gruber: Was it good?",
      "13-07-2017, 09:12 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # MM-dd-yyyy, hh:mm:ss a
  expect_equal(
    rwa_read(txt = c(
      "07-12-2017, 10:35:22 PM - Johannes Gruber: Was it good?",
      "07-13-2017, 09:12:44 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # MM-dd-yyyy, hh:mm a
  expect_equal(
    rwa_read(txt = c(
      "07-12-2017, 10:35 PM - Johannes Gruber: Was it good?",
      "07-13-2017, 09:12 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # MM-dd-yyyy, HH:mm:ss
  expect_equal(
    rwa_read(txt = c(
      "07-12-2017, 22:35:22 - Johannes Gruber: Was it good?",
      "07-13-2017, 09:12:44 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # MM-dd-yyyy, HH:mm
  expect_equal(
    rwa_read(txt = c(
      "07-12-2017, 22:35 - Johannes Gruber: Was it good?",
      "07-13-2017, 09:12 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  ##### - + two-digit year
  # dd-MM-yy, hh:mm:ss a
  expect_equal(
    rwa_read(txt = c(
      "12-07-17, 10:35:22 PM - Johannes Gruber: Was it good?",
      "13-07-17, 09:12:44 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # dd-MM-yy, hh:mm a
  expect_equal(
    rwa_read(txt = c(
      "12-07-17, 10:35 PM - Johannes Gruber: Was it good?",
      "13-07-17, 09:12 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # dd-MM-yy, HH:mm:ss
  expect_equal(
    rwa_read(txt = c(
      "12-07-17, 22:35:22 - Johannes Gruber: Was it good?",
      "13-07-17, 09:12:44 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # dd-MM-yy, HH:mm
  expect_equal(
    rwa_read(txt = c(
      "12-07-17, 22:35 - Johannes Gruber: Was it good?",
      "13-07-17, 09:12 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # MM-dd-yy, hh:mm:ss a
  expect_equal(
    rwa_read(txt = c(
      "07-12-17, 10:35:22 PM - Johannes Gruber: Was it good?",
      "07-13-17, 09:12:44 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # MM-dd-yy, hh:mm a
  expect_equal(
    rwa_read(txt = c(
      "07-12-17, 10:35 PM - Johannes Gruber: Was it good?",
      "07-13-17, 09:12 AM - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  # MM-dd-yy, HH:mm:ss
  expect_equal(
    rwa_read(txt = c(
      "07-12-17, 22:35:22 - Johannes Gruber: Was it good?",
      "07-13-17, 09:12:44 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # MM-dd-yy, HH:mm
  expect_equal(
    rwa_read(txt = c(
      "07-12-17, 22:35 - Johannes Gruber: Was it good?",
      "07-13-17, 09:12 - R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  ##### weirdo format
  expect_equal(
    rwa_read(txt = c(
      "10:35 PM, 07 20 - Johannes Gruber: Was it good?",
      "9:12 AM, 07 20 - R: Yes, it was"
    ), tz = "GMT")$time,
    structure(c(1532126114.674, 1532077934.674),
              tzone = "GMT",
              class = c("POSIXct",
                        "POSIXt")),
    tolerance = 60
  )
  ##### special separators
  # []
  expect_equal(
    rwa_read(txt = c(
      "[12.07.2017, 22:35:22] Johannes Gruber: Was it good?",
      "[13.07.2017, 09:12:44] R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # :
  expect_equal(
    rwa_read(txt = c(
      "12.07.2017, 22:35:22: Johannes Gruber: Was it good?",
      "13.07.2017, 09:12:44: R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 5
  )
  # : + no-seconds
  expect_equal(
    rwa_read(txt = c(
      "12.07.2017, 22:35: Johannes Gruber: Was it good?",
      "13.07.2017, 09:12: R: Yes, it was"
    ), tz = "GMT")$time,
    converted,
    tolerance = 60
  )
  ##### custom format and warning
  expect_equal(
    rwa_read(txt = c(
      "07,12,2017, 22:35 - Johannes Gruber: Was it good?",
      "07,13,2017, 09:12 - R: Yes, it was"
    ), tz = "GMT", format = "MM,dd,yy, HH:mm")$time,
    converted,
    tolerance = 60
  )
  expect_warning(
    rwa_read(txt = c(
      "20 09 17, 16:54 - Johannes Gruber: Was it good?",
      "20 09 17, 16:54 -  R: Yes, it was"
    )),
    "Time conversion did not work correctly. Provide a custom format or add an issue at www.github.com/JBGruber/rwhatsapp."
  )
})

test_that("See if author is converted correctly", {
  expect_equal(
    rwa_read(txt = c(
      "12.07.17, 22:35:22: Johannes Gruber: Was it good?",
      "13.07.17, 09:12:44: R: Yes, it was"
    ))$author,
    structure(1:2, .Label = c("Johannes Gruber", "R"),
              class = "factor")
  )
  expect_equal(
    rwa_read(txt = c(
      "12.07.17, 22:35:22 - Johannes Gruber: Was it good?",
      "13.07.17, 09:12:44 - R: Yes, it was"
    ))$author,
    structure(1:2, .Label = c("Johannes Gruber", "R"),
              class = "factor")
  )
  expect_equal(
    rwa_read(txt = c(
      "12.07.17, 10:35 PM - Johannes Gruber: Was it good?",
      "13.07.17, 10:36 PM  - R: Yes, it was"
    ))$author,
    structure(1:2, .Label = c("Johannes Gruber", "R"),
              class = "factor")
  )
  expect_equal(
    rwa_read(txt = c(
      "[20.09.17, 16:54:32] Johannes Gruber: Was it good?",
      "[20.09.17, 16:54:43] R: Yes, it was"
    ), verbose = TRUE)$author,
    structure(1:2, .Label = c("Johannes Gruber", "R"),
              class = "factor")
  )
})


test_that("reading from file", {
  expect_equal({
    out <- rwa_read(txt = history, tz = "GMT", encoding = "UTF-8", verbose = TRUE)
    # weird behaviour of tibble for comparison
    as.data.frame(out)[, 1:3]
  }, {
    out <- readRDS("../files/rwa_read.RDS")
    as.data.frame(out)[, 1:3]
  },
  tolerance = 60
  )
  expect_equal({
    as.data.frame(rwa_read(txt = c(history, history), tz = "GMT", encoding = "UTF-8", verbose = TRUE))[, 1:3]
  }, as.data.frame(rbind(readRDS("../files/rwa_read.RDS"), readRDS("../files/rwa_read.RDS")))[, 1:3],
  tolerance = 60
  )
})


test_that("warning", {
  expect_error(rwa_read(txt = 1),
               "Provide either a path to one or multiple txt files of a WhatsApp history or the history itself as character object.")
})
