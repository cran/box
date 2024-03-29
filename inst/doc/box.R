## ----eval = FALSE-------------------------------------------------------------
#  box::use(./bio/seq)

## ----eval = FALSE-------------------------------------------------------------
#  ls()

## ----eval = FALSE-------------------------------------------------------------
#  seq

## ----eval = FALSE-------------------------------------------------------------
#  ls(seq)

## ----eval = FALSE-------------------------------------------------------------
#  box::help(seq$revcomp)

## ----eval = FALSE-------------------------------------------------------------
#  s = seq$seq(
#      gene1 = 'GATTACAGATCAGCTCAGCACCTAGCACTATCAGCAAC',
#      gene2 = 'CATAGCAACTGACATCACAGCG'
#  )
#  
#  seq$is_valid(s)

## ----eval = FALSE-------------------------------------------------------------
#  s

## ----eval = FALSE-------------------------------------------------------------
#  getS3method('print', 'bio/seq')

## ----eval = FALSE-------------------------------------------------------------
#  box::unload(seq)

## ----eval = FALSE-------------------------------------------------------------
#  options(box.path = getwd())
#  box::use(bio/seq[revcomp, is_valid])

## ----eval = FALSE-------------------------------------------------------------
#  is_valid(s)

## ----eval = FALSE-------------------------------------------------------------
#  revcomp(s)

## ----eval = FALSE-------------------------------------------------------------
#  search()

## ----eval = FALSE-------------------------------------------------------------
#  detach()
#  
#  seq_table = function (s) {
#      box::use(./bio/seq[...])
#      table(s)
#  }
#  
#  seq_table(s)

## ----eval = FALSE-------------------------------------------------------------
#  search()

## ----eval = FALSE-------------------------------------------------------------
#  table(s)

## ----eval = FALSE-------------------------------------------------------------
#  #' @export
#  box::use(./seq)

## ----eval = FALSE-------------------------------------------------------------
#  options(box.path = NULL) # Reset search path
#  box::use(./bio)
#  ls(bio)

## ----eval = FALSE-------------------------------------------------------------
#  ls(bio$seq)

## ----eval = FALSE-------------------------------------------------------------
#  bio$seq$revcomp('CAT')

## ----eval = FALSE-------------------------------------------------------------
#  #' @export
#  box::use(./seq[...])

## ----eval = FALSE-------------------------------------------------------------
#  .on_load = function (ns) {
#      message(
#          'Loading module "', box::name(), '"\n',
#          'Module path: "', basename(box::file()), '"'
#      )
#  }
#  
#  box::export() # Mark as a ‘box’ module.

## ----eval = FALSE-------------------------------------------------------------
#  box::use(./info)

## ----eval = FALSE-------------------------------------------------------------
#  box::use(./info)

## ----eval = FALSE-------------------------------------------------------------
#  box::reload(info)

