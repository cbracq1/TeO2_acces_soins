
<!-- rnb-text-begin -->

---
title: "06_Reg_plot"
author: "Clémence Bracq"
date: "01/09/2023"
output:
  html_notebook: default
  html_document:
    df_print: paged
  pdf_document: default
editor_options:
  markdown:
    wrap: 72
---

# Modélisation {.tabset .tabset-fade}


<!-- rnb-text-end -->



<!-- rnb-text-begin -->



<!-- rnb-text-end -->



<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuaW5kaXZfbW9kIDwtIGluZGl2X21vZCAlPiUgXG4gIG11dGF0ZShwcm9kZXNhbnRlID0gaWZlbHNlKHBfbmFmODggJWluJSBjKDg4LCA4NywgODYpLCAxLCAwKSlcbmluZGl2X21vZCA8LSBpbmRpdl9tb2QgJT4lIG11dGF0ZSh0YWlsbGV2aWxsZSA9IGlmZWxzZShjb21fcG9wX2luZF9wb25kPD0gMjUwMDAsIFwibW9pbnMgZGUgMjUwMDAgaGFiaXRhbnRzXCIsIFwiUGx1cyBkZSAyNTAwMCBoYWJpdGFudHNcIikpXG5pbmRpdl9tb2QgPC0gaW5kaXZfbW9kICU+JSBcbiAgbXV0YXRlKGlyaXNfcGN0X2ltYWdoX2FmcyA9IGlyaXNfcGN0X2ltYWdoICsgaXJpc19wY3RfaW1hZnMpICU+JSBcbiAgbXV0YXRlKGlyaXNfcGN0X2ltZXUgPSBpcmlzX3BjdF9pbWV1cyArIGlyaXNfcGN0X2ltdWUyOClcblxuaW5kaXZfbW9kIDwtIGluZGl2X21vZCAlPiUgXG4gIG11dGF0ZShjb21fcGN0X2ltYWdoX2FmcyA9IGNvbV9wY3RfaW1hZ2ggKyBjb21fcGN0X2ltYWZzKSAlPiUgXG4gIG11dGF0ZShjb21fcGN0X2ltZXUgPSBjb21fcGN0X2ltZXVzICsgY29tX3BjdF9pbXVlMjgpXG5cbiMgaW5kaXZfbW9kIDwtIGluZGl2X21vZCAlPiVcbiMgICBtdXRhdGUoaXJpc19wY3RfaW1taV90b3AgPSBudGlsZShpcmlzX3BjdF9pbW1pLCAzKSxcbiMgICAgICAgICAgaXJpc19wY3RfaW1taV90b3AgPSBjYXNlX3doZW4oXG4jICAgICAgICAgICAgaXJpc19wY3RfaW1taV90b3AgPT0gMSB+IFwiUHJlbWllciB0ZXJjaWxlXCIsXG4jICAgICAgICAgICAgaXJpc19wY3RfaW1taV90b3AgPT0gMiB+IFwiRGV1eGnDqG1lIHRlcmNpbGVcIixcbiMgICAgICAgICAgICBpcmlzX3BjdF9pbW1pX3RvcCA9PSAzIH4gXCJUcm9pc2nDqG1lIHRlcmNpbGVcIlxuIyAgICAgICAgICApKVxuaW5kaXZfbW9kIDwtIGluZGl2X21vZCAlPiVcbiAgbXV0YXRlKGlyaXNfcGN0X2ltYWdoX2Fmc19jYXQgPSBjdXQoaXJpc19wY3RfaW1hZ2hfYWZzLCBicmVha3MgPSBxdWFudGlsZShpcmlzX3BjdF9pbWFnaF9hZnMsIHByb2JzPXNlcSgwLCAxLCAxLzMpKSkpXG5cbiMgaW5kaXZfbW9kIDwtIGluZGl2X21vZCAlPiVcbiMgICBtdXRhdGUoaXJpc19wY3RfaW1hZ2hfdG9wID0gbnRpbGUoaXJpc19wY3RfaW1hZ2gsIDMpLFxuIyAgICAgICAgICBpcmlzX3BjdF9pbWFnaF90b3AgPSBjYXNlX3doZW4oXG4jICAgICAgICAgICAgaXJpc19wY3RfaW1hZ2hfdG9wID09IDEgfiBcIlByZW1pZXIgdGVyY2lsZVwiLFxuIyAgICAgICAgICAgIGlyaXNfcGN0X2ltYWdoX3RvcCA9PSAyIH4gXCJEZXV4acOobWUgdGVyY2lsZVwiLFxuIyAgICAgICAgICAgIGlyaXNfcGN0X2ltYWdoX3RvcCA9PSAzIH4gXCJUcm9pc2nDqG1lIHRlcmNpbGVcIlxuIyAgICAgICAgICApKVxuXG4jIGluZGl2X21vZCA8LSBpbmRpdl9tb2QgJT4lXG4jICAgbXV0YXRlKGlyaXNfcGN0X2ltYWZzX3RvcCA9IG50aWxlKGlyaXNfcGN0X2ltYWZzLCAzKSxcbiMgICAgICAgICAgaXJpc19wY3RfaW1hZnNfdG9wID0gY2FzZV93aGVuKFxuIyAgICAgICAgICAgIGlyaXNfcGN0X2ltYWZzX3RvcCA9PSAxIH4gXCJQcmVtaWVyIHRlcmNpbGVcIixcbiMgICAgICAgICAgICBpcmlzX3BjdF9pbWFmc190b3AgPT0gMiB+IFwiRGV1eGnDqG1lIHRlcmNpbGVcIixcbiMgICAgICAgICAgICBpcmlzX3BjdF9pbWFmc190b3AgPT0gMyB+IFwiVHJvaXNpw6htZSB0ZXJjaWxlXCJcbiMgICAgICAgICAgKSlcblxuXG5pbmRpdl9tb2QgPC0gaW5kaXZfbW9kICU+JVxuICBtdXRhdGUoaXJpc19wY3RfaW1hc2llX2NhdCA9IGN1dChpcmlzX3BjdF9pbWFzaWUsIGJyZWFrcyA9IHF1YW50aWxlKGlyaXNfcGN0X2ltYXNpZSwgcHJvYnM9c2VxKDAsIDEsIDEvMykpKSlcblxuIyBcbiMgaW5kaXZfbW9kIDwtIGluZGl2X21vZCAlPiVcbiMgICBtdXRhdGUoaW5kaXZfbW9kIDwtIGluZGl2X21vZCAlPiUgXG4jIGluZGl2X21vZCA8LSBpbmRpdl9tb2QgJT4lIFxuIyAgIG11dGF0ZShpcmlzX3BjdF9pbWFnaF9hZnMgPSBpcmlzX3BjdF9pbWFnaCArIGlyaXNfcGN0X2ltYWZzKSAlPiUgICBtdXRhdGUoaXJpc19wY3RfaW1hZ2hfYWZzID0gaXJpc19wY3RfaW1hZ2ggKyBpcmlzX3BjdF9pbWFmcykgJT4lIGlyaXNfcGN0X2ltZXVzX3RvcCA9IG50aWxlKGlyaXNfcGN0X2ltZXVzLCAzKSxcbiMgICAgICAgICAgaXJpc19wY3RfaW1ldXNfdG9wID0gY2FzZV93aGVuKFxuIyAgICAgICAgICAgIGlyaXNfcGN0X2ltZXVzX3RvcCA9PSAxIH4gXCJQcmVtaWVyIHRlcmNpbGVcIixcbiMgICAgICAgICAgICBpcmlzX3BjdF9pbWV1c190b3AgPT0gMiB+IFwiRGV1eGnDqG1lIHRlcmNpbGVcIixcbiMgICAgICAgICAgICBpcmlzX3BjdF9pbWV1c190b3AgPT0gMyB+IFwiVHJvaXNpw6htZSB0ZXJjaWxlXCJcbiMgICAgICAgICAgKSlcbiMgXG4jIGluZGl2X21vZCA8LSBpbmRpdl9tb2QgJT4lXG4jICAgbXV0YXRlKGlyaXNfcGN0X2ltdWUyOF90b3AgPSBudGlsZShpcmlzX3BjdF9pbXVlMjgsIDMpLFxuIyAgICAgICAgICBpcmlzX3BjdF9pbXVlMjhfdG9wID0gY2FzZV93aGVuKFxuIyAgICAgICAgICAgIGlyaXNfcGN0X2ltdWUyOF90b3AgPT0gMSB+IFwiUHJlbWllciB0ZXJjaWxlXCIsXG4jICAgICAgICAgICAgaXJpc19wY3RfaW11ZTI4X3RvcCA9PSAyIH4gXCJEZXV4acOobWUgdGVyY2lsZVwiLFxuIyAgICAgICAgICAgIGlyaXNfcGN0X2ltdWUyOF90b3AgPT0gMyB+IFwiVHJvaXNpw6htZSB0ZXJjaWxlXCJcbiMgICAgICAgICAgKSlcblxuaW5kaXZfbW9kIDwtIGluZGl2X21vZCAlPiVcbiAgbXV0YXRlKGlyaXNfcGN0X2ltZXVfY2F0ID0gY3V0KGlyaXNfcGN0X2ltZXUsIGJyZWFrcyA9IHF1YW50aWxlKGlyaXNfcGN0X2ltZXUsIHByb2JzPXNlcSgwLCAxLCAxLzMpKSkpXG5cblxuXG5gYGAifQ== -->

```r
indiv_mod <- indiv_mod %>% 
  mutate(prodesante = ifelse(p_naf88 %in% c(88, 87, 86), 1, 0))
indiv_mod <- indiv_mod %>% mutate(tailleville = ifelse(com_pop_ind_pond<= 25000, "moins de 25000 habitants", "Plus de 25000 habitants"))
indiv_mod <- indiv_mod %>% 
  mutate(iris_pct_imagh_afs = iris_pct_imagh + iris_pct_imafs) %>% 
  mutate(iris_pct_imeu = iris_pct_imeus + iris_pct_imue28)

indiv_mod <- indiv_mod %>% 
  mutate(com_pct_imagh_afs = com_pct_imagh + com_pct_imafs) %>% 
  mutate(com_pct_imeu = com_pct_imeus + com_pct_imue28)

# indiv_mod <- indiv_mod %>%
#   mutate(iris_pct_immi_top = ntile(iris_pct_immi, 3),
#          iris_pct_immi_top = case_when(
#            iris_pct_immi_top == 1 ~ "Premier tercile",
#            iris_pct_immi_top == 2 ~ "Deuxième tercile",
#            iris_pct_immi_top == 3 ~ "Troisième tercile"
#          ))
indiv_mod <- indiv_mod %>%
  mutate(iris_pct_imagh_afs_cat = cut(iris_pct_imagh_afs, breaks = quantile(iris_pct_imagh_afs, probs=seq(0, 1, 1/3))))

# indiv_mod <- indiv_mod %>%
#   mutate(iris_pct_imagh_top = ntile(iris_pct_imagh, 3),
#          iris_pct_imagh_top = case_when(
#            iris_pct_imagh_top == 1 ~ "Premier tercile",
#            iris_pct_imagh_top == 2 ~ "Deuxième tercile",
#            iris_pct_imagh_top == 3 ~ "Troisième tercile"
#          ))

# indiv_mod <- indiv_mod %>%
#   mutate(iris_pct_imafs_top = ntile(iris_pct_imafs, 3),
#          iris_pct_imafs_top = case_when(
#            iris_pct_imafs_top == 1 ~ "Premier tercile",
#            iris_pct_imafs_top == 2 ~ "Deuxième tercile",
#            iris_pct_imafs_top == 3 ~ "Troisième tercile"
#          ))


indiv_mod <- indiv_mod %>%
  mutate(iris_pct_imasie_cat = cut(iris_pct_imasie, breaks = quantile(iris_pct_imasie, probs=seq(0, 1, 1/3))))

# 
# indiv_mod <- indiv_mod %>%
#   mutate(indiv_mod <- indiv_mod %>% 
# indiv_mod <- indiv_mod %>% 
#   mutate(iris_pct_imagh_afs = iris_pct_imagh + iris_pct_imafs) %>%   mutate(iris_pct_imagh_afs = iris_pct_imagh + iris_pct_imafs) %>% iris_pct_imeus_top = ntile(iris_pct_imeus, 3),
#          iris_pct_imeus_top = case_when(
#            iris_pct_imeus_top == 1 ~ "Premier tercile",
#            iris_pct_imeus_top == 2 ~ "Deuxième tercile",
#            iris_pct_imeus_top == 3 ~ "Troisième tercile"
#          ))
# 
# indiv_mod <- indiv_mod %>%
#   mutate(iris_pct_imue28_top = ntile(iris_pct_imue28, 3),
#          iris_pct_imue28_top = case_when(
#            iris_pct_imue28_top == 1 ~ "Premier tercile",
#            iris_pct_imue28_top == 2 ~ "Deuxième tercile",
#            iris_pct_imue28_top == 3 ~ "Troisième tercile"
#          ))

indiv_mod <- indiv_mod %>%
  mutate(iris_pct_imeu_cat = cut(iris_pct_imeu, breaks = quantile(iris_pct_imeu, probs=seq(0, 1, 1/3))))

```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



## Accessibilité Fonction définition du modèle


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuaW5kaXZfbW9kIDwtIGluZGl2X21vZCAlPiUgXG4gIG11dGF0ZSh2aWxsZSA9IGlmZWxzZShjb21fcG9wX2luZF9wb25kPj0gMjUwMDAsIFwiUGx1cyBkZSAyNSAwMDAgaGFiaXRhbnRzXCIsIFwiTW9pbnMgZGUgMjUwMDAgaGFiaXRhbnRzXCIpKVxuYGBgIn0= -->

```r
indiv_mod <- indiv_mod %>% 
  mutate(ville = ifelse(com_pop_ind_pond>= 25000, "Plus de 25 000 habitants", "Moins de 25000 habitants"))
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuaW5kaXZfbW9kIDwtIGluZGl2X21vZCAlPiUgXG4gIG11dGF0ZShpbW1pZ3JlID0gaWZlbHNlKGdyb3VwMT09XCJJbW1pZ3LDqSAobsOpIMOpdHJhbmdlciDDoCBsJ8OpdHJhbmdlciB5IGNvbXByaXMgcsOpaW50w6lncsOpc1wiLCAxLCAwKSlcbmBgYCJ9 -->

```r
indiv_mod <- indiv_mod %>% 
  mutate(immigre = ifelse(group1=="Immigré (né étranger à l'étranger y compris réintégrés", 1, 0))
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuIyMgUmVjb2RhZ2UgZGUgaW5kaXZfbW9kJG9yaWdpbmVfdG91c19nMiBlbiBpbmRpdl9tb2Qkb3JpZ2luZV90b3VzX2cyX3JlY1xuaW5kaXZfbW9kJG9yaWdpbmVfdG91c19nMl9yZWMgPC0gaW5kaXZfbW9kJG9yaWdpbmVfdG91c19nMiAlPiVcbiAgZmN0X3JlY29kZShcbiAgICBcIlBvcHVsYXRpb24gc2FucyBhc2NlbmRhbmNlIG1pZ3JhdG9pcmUgZGlyZWN0ZVwiID0gXCJBdXRyZXMgZnJhbsOnYWlzIG7DqXMgaG9ycyBkZSBGcmFuY2UgbcOpdHJvXCIsXG4gICAgXCJQb3B1bGF0aW9uIHNhbnMgYXNjZW5kYW5jZSBtaWdyYXRvaXJlIGRpcmVjdGVcIiA9IFwiRGVzY2VuZGFudHMgZCdhdXRyZXMgZnJhbsOnYWlzIG7DqXMgaG9ycyBkZSBmcmFuY2UgbcOpdHJvXCIsXG4gICAgXCJJbW1pZ3LDqXMgZCdBbGfDqXJpZSwgTWFyb2Mgb3UgVHVuaXNpZVwiID0gXCJJbW1pZ3LDqXMgZCdBbGfDqXJpZVwiLFxuICAgIFwiRGVzY2VuZGFudHMgZCdpbW1pZ3LDqShzKSBvcmlnaW5haXJlcyBkJ0FsZ8OpcmllLCBkdSBNYXJvYyBvdSBkZSBsYSBUdW5pc2llXCIgPSBcIkRlc2NlbmRhbnRzIGQnaW1taWdyw6kocykgb3JpZ2luYWlyZXMgZCdBbGfDqXJpZVwiLFxuICAgIFwiSW1taWdyw6lzIGQnQWxnw6lyaWUsIE1hcm9jIG91IFR1bmlzaWVcIiA9IFwiSW1taWdyw6lzIGR1IE1hcm9jL1R1bmlzaWVcIixcbiAgICBcIkRlc2NlbmRhbnRzIGQnaW1taWdyw6kocykgb3JpZ2luYWlyZXMgZCdBbGfDqXJpZSwgZHUgTWFyb2Mgb3UgZGUgbGEgVHVuaXNpZVwiID0gXCJEZXNjZW5kYW50cyBkJ2ltbWlncsOpKHMpIG9yaWdpbmFpcmVzIGR1IE1hcm9jIG91IGRlIFR1bmlzaWVcIixcbiAgICBcIkltbWlncsOpcyBkJ2F1dHJlcyBwYXlzIGQnQWZyaXF1ZVwiID0gXCJJbW1pZ3LDqXMgZCdBZnJpcXVlIHNhaMOpbGllbm5lXCIsXG4gICAgXCJEZXNjZW5kYW50cyBkJ2ltbWlncsOpKHMpIG9yaWdpbmFpcmVzIGQnYXV0cmVzIHBheXMgZCdBZnJpcXVlXCIgPSBcIkRlc2NlbmRhbnRzIGQnaW1taWdyw6kocykgb3JpZ2luYWlyZXMgZCdBZnJpcXVlIHNhaMOpbGllbm5lXCIsXG4gICAgXCJJbW1pZ3LDqXMgZCdhdXRyZXMgcGF5cyBkJ0FmcmlxdWVcIiA9IFwiSW1taWdyw6lzIGQnQWZyaXF1ZSBndWluw6llbm5lIG91IGNlbnRyYWxlXCIsXG4gICAgXCJEZXNjZW5kYW50cyBkJ2ltbWlncsOpKHMpIG9yaWdpbmFpcmVzIGQnYXV0cmVzIHBheXMgZCdBZnJpcXVlXCIgPSBcIkRlc2NlbmRhbnRzIGQnaW1taWdyw6kocykgb3JpZ2luYWlyZXMgZCdBZnJpcXVlIGd1aW7DqWVubmUgb3UgY2VudHJhbGVcIixcbiAgICBcIkltbWlncsOpcyBkJ0FzaWVcIiA9IFwiSW1taWdyw6lzIGQnQXNpZSBkdSBTdWQtZXN0XCIsXG4gICAgXCJEZXNjZW5kYW50cyBkJ2ltbWlncsOpKHMpIG9yaWdpbmFpcmVzIGQnQXNpZVwiID0gXCJEZXNjZW5kYW50cyBkJ2ltbWlncsOpKHMpIG9yaWdpbmFpcmVzIGQnQXNpZSBkdSBTdWQtZXN0XCIsXG4gICAgXCJJbW1pZ3LDqXMgZCdBc2llXCIgPSBcIkltbWlncsOpcyBkZSBDaGluZVwiLFxuICAgIFwiSW1taWdyw6lzIGQnQXNpZVwiID0gXCJJbW1pZ3LDqXMgZCdhdXRyZXMgcGF5cyBkJ0FzaWVcIixcbiAgICBcIkRlc2NlbmRhbnRzIGQnaW1taWdyw6kocykgb3JpZ2luYWlyZXMgZCdBc2llXCIgPSBcIkRlc2NlbmRhbnRzIGQnaW1taWdyw6kocykgb3JpZ2luYWlyZXMgZCdhdXRyZXMgcGF5cyBkJ0FzaWVcIixcbiAgICBcIkltbWlncsOpcyBkdSBQb3J0dWdhbCwgZCdFc3BhZ25lIG91IGQnSXRhbGllXCIgPSBcIkltbWlncsOpcyBkdSBQb3J0dWdhbFwiLFxuICAgIFwiRGVzY2VuZGFudHMgZCdpbW1pZ3LDqShzKSBvcmlnaW5haXJlcyBkdSBQb3J0dWdhbCwgZCdFc3BhZ25lIG91IGQnSXRhbGllXCIgPSBcIkRlc2NlbmRhbnRzIGQnaW1taWdyw6kocykgb3JpZ2luYWlyZXMgZHUgUG9ydHVnYWxcIixcbiAgICBcIkltbWlncsOpcyBkdSBQb3J0dWdhbCwgZCdFc3BhZ25lIG91IGQnSXRhbGllXCIgPSBcIkltbWlncsOpcyBkJ0VzcGFnbmUgb3UgZCdJdGFsaWVcIixcbiAgICBcIkRlc2NlbmRhbnRzIGQnaW1taWdyw6kocykgb3JpZ2luYWlyZXMgZHUgUG9ydHVnYWwsIGQnRXNwYWduZSBvdSBkJ0l0YWxpZVwiID0gXCJEZXNjZW5kYW50cyBkJ2ltbWlncsOpKHMpIG9yaWdpbmFpcmVzIGQnRXNwYWduZSBvdSBkJ0l0YWxpZVwiLFxuICAgIFwiSW1taWdyw6lzIGQnYXV0cmVzIHBheXMgZCdFdXJvcGVcIiA9IFwiSW1taWdyw6lzIGQnYXV0cmVzIHBheXMgZGUgbCdVRTI3XCIsXG4gICAgXCJEZXNjZW5kYW50cyBkJ2ltbWlncsOpKHMpIG9yaWdpbmFpcmVzIGQnYXV0cmVzIHBheXMgZCdFdXJvcGVcIiA9IFwiRGVzY2VuZGFudHMgZCdpbW1pZ3LDqShzKSBvcmlnaW5haXJlcyBkJ2F1dHJlcyBwYXlzIGRlIGwnVUUyN1wiXG4gIClcblxuIyMgUmVjb2RhZ2UgZGUgaW5kaXZfbW9kJG1faXJyZWcgZW4gaW5kaXZfbW9kJG1faXJyZWdfcmVjXG5pbmRpdl9tb2QkbV9pcnJlZ19yZWMgPC0gaW5kaXZfbW9kJG1faXJyZWcgJT4lXG4gIGZjdF9yZWNvZGUoXG4gICAgXCJPdWkgaXJyZWdcIiA9IFwiT3VpXCIsXG4gICAgXCJOb24gcGFzIGQnaXJyZWdcIiA9IFwiTm9uXCIsXG4gICAgXCJOU1AsIHJlZnVzLCBOQVwiID0gXCJWb3VzIG5lIHNhdmV6IHBhc1wiLFxuICAgIFwiTlNQLCByZWZ1cywgTkFcIiA9IFwiVm91cyBuZSB2b3VsZXogcGFzIHLDqXBvbmRyZVwiXG4gICkgJT4lXG4gIGZjdF9leHBsaWNpdF9uYShcIk5TUCwgcmVmdXMsIE5BXCIpXG5gYGAifQ== -->

```r
## Recodage de indiv_mod$origine_tous_g2 en indiv_mod$origine_tous_g2_rec
indiv_mod$origine_tous_g2_rec <- indiv_mod$origine_tous_g2 %>%
  fct_recode(
    "Population sans ascendance migratoire directe" = "Autres français nés hors de France métro",
    "Population sans ascendance migratoire directe" = "Descendants d'autres français nés hors de france métro",
    "Immigrés d'Algérie, Maroc ou Tunisie" = "Immigrés d'Algérie",
    "Descendants d'immigré(s) originaires d'Algérie, du Maroc ou de la Tunisie" = "Descendants d'immigré(s) originaires d'Algérie",
    "Immigrés d'Algérie, Maroc ou Tunisie" = "Immigrés du Maroc/Tunisie",
    "Descendants d'immigré(s) originaires d'Algérie, du Maroc ou de la Tunisie" = "Descendants d'immigré(s) originaires du Maroc ou de Tunisie",
    "Immigrés d'autres pays d'Afrique" = "Immigrés d'Afrique sahélienne",
    "Descendants d'immigré(s) originaires d'autres pays d'Afrique" = "Descendants d'immigré(s) originaires d'Afrique sahélienne",
    "Immigrés d'autres pays d'Afrique" = "Immigrés d'Afrique guinéenne ou centrale",
    "Descendants d'immigré(s) originaires d'autres pays d'Afrique" = "Descendants d'immigré(s) originaires d'Afrique guinéenne ou centrale",
    "Immigrés d'Asie" = "Immigrés d'Asie du Sud-est",
    "Descendants d'immigré(s) originaires d'Asie" = "Descendants d'immigré(s) originaires d'Asie du Sud-est",
    "Immigrés d'Asie" = "Immigrés de Chine",
    "Immigrés d'Asie" = "Immigrés d'autres pays d'Asie",
    "Descendants d'immigré(s) originaires d'Asie" = "Descendants d'immigré(s) originaires d'autres pays d'Asie",
    "Immigrés du Portugal, d'Espagne ou d'Italie" = "Immigrés du Portugal",
    "Descendants d'immigré(s) originaires du Portugal, d'Espagne ou d'Italie" = "Descendants d'immigré(s) originaires du Portugal",
    "Immigrés du Portugal, d'Espagne ou d'Italie" = "Immigrés d'Espagne ou d'Italie",
    "Descendants d'immigré(s) originaires du Portugal, d'Espagne ou d'Italie" = "Descendants d'immigré(s) originaires d'Espagne ou d'Italie",
    "Immigrés d'autres pays d'Europe" = "Immigrés d'autres pays de l'UE27",
    "Descendants d'immigré(s) originaires d'autres pays d'Europe" = "Descendants d'immigré(s) originaires d'autres pays de l'UE27"
  )

## Recodage de indiv_mod$m_irreg en indiv_mod$m_irreg_rec
indiv_mod$m_irreg_rec <- indiv_mod$m_irreg %>%
  fct_recode(
    "Oui irreg" = "Oui",
    "Non pas d'irreg" = "Non",
    "NSP, refus, NA" = "Vous ne savez pas",
    "NSP, refus, NA" = "Vous ne voulez pas répondre"
  ) %>%
  fct_explicit_na("NSP, refus, NA")
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiQXZpcyA6IGBmY3RfZXhwbGljaXRfbmEoKWAgd2FzIGRlcHJlY2F0ZWQgaW4gZm9yY2F0cyAxLjAuMC5cblBsZWFzZSB1c2UgYGZjdF9uYV92YWx1ZV90b19sZXZlbCgpYCBpbnN0ZWFkLlxuIn0= -->

```
Avis : `fct_explicit_na()` was deprecated in forcats 1.0.0.
Please use `fct_na_value_to_level()` instead.
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->





<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucmVnMCA8LSBmdW5jdGlvbih2YXIpIHtcbiAgICAgbW9kZWwgPC0gbG1fcm9idXN0KHZhciB+IG9yaWdpbmVfdG91c19nMl9yZWMjK1xuICAgICAgICAgICAgICAgICAgIyBzZXhlZStcbiAgICAgICAgICAgICAgICAgICMgYWdlbnEgK1xuICAgICAgICAgICAgICAgICAgIyBjc25xX2VnbyArXG4gICAgICAgICAgICAgICAgICAjIHRhaWxsZXZpbGxlICtcbiAgICAgICAgICAgICAgICAgICMgbF9pbW1pXG4gICAgICAgICAgICAgICAgLCB3ZWlnaHRzID0gcG9pZHNpX2VudGllclxuICAgICAgICAgICAgICAgICxkYXRhID0gaW5kaXZfbW9kKVxuICByZXR1cm4obW9kZWwpfVxuXG5cbnJlZzBfZ3JvdXAxIDwtIGZ1bmN0aW9uKHZhcikge1xuICAgICBtb2RlbCA8LSBsbV9yb2J1c3QodmFyIH4gZ3JvdXAxIytcbiAgICAgICAgICAgICAgICAgICMgc2V4ZWUrXG4gICAgICAgICAgICAgICAgICAjIGFnZW5xICtcbiAgICAgICAgICAgICAgICAgICMgY3NucV9lZ28gK1xuICAgICAgICAgICAgICAgICAgIyB0YWlsbGV2aWxsZSArXG4gICAgICAgICAgICAgICAgICAjIGxfaW1taVxuICAgICAgICAgICAgICAgICwgd2VpZ2h0cyA9IHBvaWRzaV9lbnRpZXJcbiAgICAgICAgICAgICAgICAsZGF0YSA9IGluZGl2X21vZClcbiAgcmV0dXJuKG1vZGVsKX1cblxucmVnMSA8LSBmdW5jdGlvbih2YXIpIHtcbiAgICAgbW9kZWwgPC0gbG1fcm9idXN0KHZhciB+IG9yaWdpbmVfdG91c19nMl9yZWMrXG4gICAgICAgICAgICAgICAgICAjIHNleGVlK1xuICAgICAgICAgICAgICAgICAgIyBhZ2VucSArXG4gICAgICAgICAgICAgICAgICAjIGNzbnFfZWdvICtcbiAgICAgICAgICAgICAgICAgIHRhaWxsZXZpbGxlICMrXG4gICAgICAgICAgICAgICAgICAgICMgZ3JvdXAxKnRhaWxsZXZpbGxlXG4gICAgICAgICAgICAgICAgICAjIGxfaW1taVxuICAgICAgICAgICAgICAgICwgd2VpZ2h0cyA9IHBvaWRzaV9lbnRpZXJcbiAgICAgICAgICAgICAgICAsZGF0YSA9IGluZGl2X21vZClcbiAgcmV0dXJuKG1vZGVsKX1cblxucmVnMiA8LSBmdW5jdGlvbih2YXIpIHtcbiAgICAgbW9kZWwgPC0gbG1fcm9idXN0KHZhciB+IG9yaWdpbmVfdG91c19nMl9yZWMrXG4gICAgICAgICAgICAgICAgICBzZXhlZStcbiAgICAgICAgICAgICAgICAgICMgYWdlbnEgK1xuICAgICAgICAgICAgICAgICAgIyBjc25xX2VnbyArXG4gICAgICAgICAgICAgICAgICB0YWlsbGV2aWxsZSAjK1xuICAgICAgICAgICAgICAgICAgICAjIGdyb3VwMSp0dXUyMDE3XG4gICAgICAgICAgICAgICAgICAjIGxfaW1taVxuICAgICAgICAgICAgICAgICwgd2VpZ2h0cyA9IHBvaWRzaV9lbnRpZXJcbiAgICAgICAgICAgICAgICAsZGF0YSA9IGluZGl2X21vZClcbiAgcmV0dXJuKG1vZGVsKX1cblxucmVnMyA8LSBmdW5jdGlvbih2YXIpIHtcbiAgICAgbW9kZWwgPC0gbG1fcm9idXN0KHZhciB+IG9yaWdpbmVfdG91c19nMl9yZWMrXG4gICAgICAgICAgICAgICAgICBzZXhlZStcbiAgICAgICAgICAgICAgICAgICMgYWdlbnEgK1xuICAgICAgICAgICAgICAgICAgY3NucV9lZ28gK1xuICAgICAgICAgICAgICAgICAgdGFpbGxldmlsbGUgIytcbiAgICAgICAgICAgICAgICAgICAgIyBncm91cDEqdHV1MjAxN1xuICAgICAgICAgICAgICAgICAgIyBsX2ltbWlcbiAgICAgICAgICAgICAgICAsIHdlaWdodHMgPSBwb2lkc2lfZW50aWVyXG4gICAgICAgICAgICAgICAgLGRhdGEgPSBpbmRpdl9tb2QpXG4gIHJldHVybihtb2RlbCl9XG5cbnJlZzQgPC0gZnVuY3Rpb24odmFyKSB7XG4gICAgIG1vZGVsIDwtIGxtX3JvYnVzdCh2YXIgfiBvcmlnaW5lX3RvdXNfZzJfcmVjK1xuICAgICAgICAgICAgICAgICAgc2V4ZWUrXG4gICAgICAgICAgICAgICAgICAjIGFnZW5xICtcbiAgICAgICAgICAgICAgICAgIGNzbnFfZWdvICtcbiAgICAgICAgICAgICAgICAgICAgbV9pcnJlZ19yZWMrXG4gICAgICAgICAgICAgICAgICB0YWlsbGV2aWxsZSAjK1xuICAgICAgICAgICAgICAgICAgICAjIGdyb3VwMSp0dXUyMDE3XG4gICAgICAgICAgICAgICAgICAjIGxfaW1taVxuICAgICAgICAgICAgICAgICwgd2VpZ2h0cyA9IHBvaWRzaV9lbnRpZXJcbiAgICAgICAgICAgICAgICAsZGF0YSA9IGluZGl2X21vZClcbiAgcmV0dXJuKG1vZGVsKX1cblxucmVnNSA8LSBmdW5jdGlvbih2YXIpIHtcbiAgICAgbW9kZWwgPC0gbG1fcm9idXN0KHZhciB+IG9yaWdpbmVfdG91c19nMl9yZWMrXG4gICAgICAgICAgICAgICAgICBzZXhlZStcbiAgICAgICAgICAgICAgICAgIGFnZW5xICtcbiAgICAgICAgICAgICAgICAgIGNzbnFfZWdvICtcbiAgICAgICAgICAgICAgICAgIHRhaWxsZXZpbGxlICtcbiAgICAgICAgICAgICAgICAgICAgIyBncm91cDEqdHV1MjAxNyAgICAgICAgICAgICAgICAgICAgXG4gICAgICAgICAgICAgICAgICAgIG1faXJyZWdfcmVjK1xuXG4gICAgICAgICAgICAgICAgICBsX2ltbWlcbiAgICAgICAgICAgICAgICAsIHdlaWdodHMgPSBwb2lkc2lfZW50aWVyXG4gICAgICAgICAgICAgICAgLGRhdGEgPSBpbmRpdl9tb2QpXG4gIHJldHVybihtb2RlbCl9XG5cblxucmVnNiA8LSAgZnVuY3Rpb24odmFyKSB7XG4gICAgIG1vZGVsIDwtIGxtX3JvYnVzdCh2YXIgfiBvcmlnaW5lX3RvdXNfZzJfcmVjK1xuICAgICAgICAgICAgICAgICAgc2V4ZWUrXG4gICAgICAgICAgICAgICAgICBhZ2VucSArXG4gICAgICAgICAgICAgICAgICBjc25xX2VnbyArXG4gICAgICAgICAgICAgICAgICB0YWlsbGV2aWxsZSArXG4gICAgICAgICAgICAgICAgICAgICMgZ3JvdXAxKnR1dTIwMTdcbiAgICAgICAgICAgICAgICAgIGxfaW1taStcbiAgICAgICAgICAgICAgICAgIG1faXJyZWdfcmVjK1xuICAgICAgICAgICAgICAgICAgICBwcm9kZXNhbnRlXG4gICAgICAgICAgICAgICAgLCB3ZWlnaHRzID0gcG9pZHNpX2VudGllclxuICAgICAgICAgICAgICAgICxkYXRhID0gaW5kaXZfbW9kKVxuICByZXR1cm4obW9kZWwpfVxuXG5yZWc3IDwtICBmdW5jdGlvbih2YXIpIHtcbiAgICAgbW9kZWwgPC0gbG1fcm9idXN0KHZhciB+IG9yaWdpbmVfdG91c19nMl9yZWMrXG4gICAgICAgICAgICAgICAgICBzZXhlZStcbiAgICAgICAgICAgICAgICAgIGFnZW5xICtcbiAgICAgICAgICAgICAgICAgIGNzbnFfZWdvICtcbiAgICAgICAgICAgICAgICAgIHRhaWxsZXZpbGxlICtcbiAgICAgICAgICAgICAgICAgIGxfaW1taStcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1faXJyZWdfcmVjK1xuXG4gICAgICAgICAgICAgICAgICAgIHByb2Rlc2FudGUrXG4gICAgICAgICAgICAgICAgICAgIG9yaWdpbmVfdG91c19nMl9yZWMqc2V4ZWVcbiAgICAgICAgICAgICAgICAsIHdlaWdodHMgPSBwb2lkc2lfZW50aWVyXG4gICAgICAgICAgICAgICAgLGRhdGEgPSBpbmRpdl9tb2QpXG4gIHJldHVybihtb2RlbCl9XG5gYGAifQ== -->

```r
reg0 <- function(var) {
     model <- lm_robust(var ~ origine_tous_g2_rec#+
                  # sexee+
                  # agenq +
                  # csnq_ego +
                  # tailleville +
                  # l_immi
                , weights = poidsi_entier
                ,data = indiv_mod)
  return(model)}


reg0_group1 <- function(var) {
     model <- lm_robust(var ~ group1#+
                  # sexee+
                  # agenq +
                  # csnq_ego +
                  # tailleville +
                  # l_immi
                , weights = poidsi_entier
                ,data = indiv_mod)
  return(model)}

reg1 <- function(var) {
     model <- lm_robust(var ~ origine_tous_g2_rec+
                  # sexee+
                  # agenq +
                  # csnq_ego +
                  tailleville #+
                    # group1*tailleville
                  # l_immi
                , weights = poidsi_entier
                ,data = indiv_mod)
  return(model)}

reg2 <- function(var) {
     model <- lm_robust(var ~ origine_tous_g2_rec+
                  sexee+
                  # agenq +
                  # csnq_ego +
                  tailleville #+
                    # group1*tuu2017
                  # l_immi
                , weights = poidsi_entier
                ,data = indiv_mod)
  return(model)}

reg3 <- function(var) {
     model <- lm_robust(var ~ origine_tous_g2_rec+
                  sexee+
                  # agenq +
                  csnq_ego +
                  tailleville #+
                    # group1*tuu2017
                  # l_immi
                , weights = poidsi_entier
                ,data = indiv_mod)
  return(model)}

reg4 <- function(var) {
     model <- lm_robust(var ~ origine_tous_g2_rec+
                  sexee+
                  # agenq +
                  csnq_ego +
                    m_irreg_rec+
                  tailleville #+
                    # group1*tuu2017
                  # l_immi
                , weights = poidsi_entier
                ,data = indiv_mod)
  return(model)}

reg5 <- function(var) {
     model <- lm_robust(var ~ origine_tous_g2_rec+
                  sexee+
                  agenq +
                  csnq_ego +
                  tailleville +
                    # group1*tuu2017                    
                    m_irreg_rec+

                  l_immi
                , weights = poidsi_entier
                ,data = indiv_mod)
  return(model)}


reg6 <-  function(var) {
     model <- lm_robust(var ~ origine_tous_g2_rec+
                  sexee+
                  agenq +
                  csnq_ego +
                  tailleville +
                    # group1*tuu2017
                  l_immi+
                  m_irreg_rec+
                    prodesante
                , weights = poidsi_entier
                ,data = indiv_mod)
  return(model)}

reg7 <-  function(var) {
     model <- lm_robust(var ~ origine_tous_g2_rec+
                  sexee+
                  agenq +
                  csnq_ego +
                  tailleville +
                  l_immi+
                                                            m_irreg_rec+

                    prodesante+
                    origine_tous_g2_rec*sexee
                , weights = poidsi_entier
                ,data = indiv_mod)
  return(model)}
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuaW5kaXZfbW9kJHBvaWRzaV9lbnRpZXIgPC0gcm91bmQoaW5kaXZfbW9kJHBvaWRzaSlcblxuYGBgIn0= -->

```r
indiv_mod$poidsi_entier <- round(indiv_mod$poidsi)

```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuaW5kaXZfbW9kJG9yaWdpbmVfdG91c19nMl9yZWMgPC0gcmVsZXZlbChpbmRpdl9tb2Qkb3JpZ2luZV90b3VzX2cyX3JlYywgcmVmID0gJ1BvcHVsYXRpb24gc2FucyBhc2NlbmRhbmNlIG1pZ3JhdG9pcmUgZGlyZWN0ZScpXG4jIGluZGl2X21vZCRvcmlnaW5lX3RvdXNfZzJfcmVjIDwtIHJlbGV2ZWwoaW5kaXZfbW9kJG9yaWdpbmVfdG91c19nMl9yZWMsIHJlZiA9ICdGcmFuY2UgbcOpdHJvcG9saXRhaW5lJylcbmluZGl2X21vZCRncm91cDEgPC0gcmVsZXZlbChpbmRpdl9tb2QkZ3JvdXAxLCByZWYgPSBcIlBvcHVsYXRpb24gbm9uIGltbWlncsOpZSBuaSBvcmlnaW5haXJlIGQnT3V0cmUtbWVyIGV0IGRlc2NlbmRhbnQgZGUgZGV1eCBwYXJlbnRzIG5vbiBpbW1pZ3LDqXMgZXQgbm9uIG9yaWdpbmFpcmVzIGQnT3V0cmUtbWVyXCIpXG5pbmRpdl9tb2QkdHV1MjAxNyA8LSByZWxldmVsKGluZGl2X21vZCR0dXUyMDE3LCByZWYgPSBcIlVuaXTDqSB1cmJhaW5lIGRlIDIwMCAwMDAgw6AgMSA5OTkgOTk5IGhhYml0YW50c1wiKVxuaW5kaXZfbW9kJHNleGVlIDwtIHJlbGV2ZWwoaW5kaXZfbW9kJHNleGVlLCByZWYgPSBcIk1hc2N1bGluXCIpXG5pbmRpdl9tb2QkbF9pbW1pIDwtIHJlbGV2ZWwoaW5kaXZfbW9kJGxfaW1taSwgcmVmID0gXCJQcmVzcXVlIHBhcyBvdSBhdWN1biBuJ2VzdCBkJ29yaWdpbmUgaW1taWdyw6llXCIpXG5cbmBgYCJ9 -->

```r
indiv_mod$origine_tous_g2_rec <- relevel(indiv_mod$origine_tous_g2_rec, ref = 'Population sans ascendance migratoire directe')
# indiv_mod$origine_tous_g2_rec <- relevel(indiv_mod$origine_tous_g2_rec, ref = 'France métropolitaine')
indiv_mod$group1 <- relevel(indiv_mod$group1, ref = "Population non immigrée ni originaire d'Outre-mer et descendant de deux parents non immigrés et non originaires d'Outre-mer")
indiv_mod$tuu2017 <- relevel(indiv_mod$tuu2017, ref = "Unité urbaine de 200 000 à 1 999 999 habitants")
indiv_mod$sexee <- relevel(indiv_mod$sexee, ref = "Masculin")
indiv_mod$l_immi <- relevel(indiv_mod$l_immi, ref = "Presque pas ou aucun n'est d'origine immigrée")

```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->



<!-- rnb-text-begin -->





## Résultats{.tabset .tabset-fade}

### Général


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


```{=html}

<!-- rnb-htmlwidget-begin eyJkZXBlbmRlbmNpZXMiOlt7Im5hbWUiOiJqcXVlcnkiLCJ2ZXJzaW9uIjoiMy42LjAiLCJzcmMiOnsiZmlsZSI6IlU6L1Ivd2luLWxpYnJhcnkvNC4yL2pxdWVyeWxpYi9saWIvMy42LjAifSwibWV0YSI6W10sInNjcmlwdCI6ImpxdWVyeS0zLjYuMC5taW4uanMiLCJzdHlsZXNoZWV0IjpbXSwiaGVhZCI6W10sImF0dGFjaG1lbnQiOltdLCJhbGxfZmlsZXMiOnRydWV9LHsibmFtZSI6ImJvb3RzdHJhcCIsInZlcnNpb24iOiIzLjMuNSIsInNyYyI6eyJmaWxlIjoiVTovUi93aW4tbGlicmFyeS80LjIvcm1hcmtkb3duL3JtZC9oL2Jvb3RzdHJhcCJ9LCJtZXRhIjp7InZpZXdwb3J0Ijoid2lkdGg9ZGV2aWNlLXdpZHRoLCBpbml0aWFsLXNjYWxlPTEifSwic2NyaXB0IjpbImpzL2Jvb3RzdHJhcC5taW4uanMiLCJzaGltL2h0bWw1c2hpdi5taW4uanMiLCJzaGltL3Jlc3BvbmQubWluLmpzIl0sInN0eWxlc2hlZXQiOiJjc3MvY29zbW8ubWluLmNzcyIsImhlYWQiOiI8c3R5bGU+aDEge2ZvbnQtc2l6ZTogMzRweDt9XG4gICAgICAgaDEudGl0bGUge2ZvbnQtc2l6ZTogMzhweDt9XG4gICAgICAgaDIge2ZvbnQtc2l6ZTogMzBweDt9XG4gICAgICAgaDMge2ZvbnQtc2l6ZTogMjRweDt9XG4gICAgICAgaDQge2ZvbnQtc2l6ZTogMThweDt9XG4gICAgICAgaDUge2ZvbnQtc2l6ZTogMTZweDt9XG4gICAgICAgaDYge2ZvbnQtc2l6ZTogMTJweDt9XG4gICAgICAgY29kZSB7Y29sb3I6IGluaGVyaXQ7IGJhY2tncm91bmQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMC4wNCk7fVxuICAgICAgIHByZTpub3QoW2NsYXNzXSkgeyBiYWNrZ3JvdW5kLWNvbG9yOiB3aGl0ZSB9PFwvc3R5bGU+IiwiYXR0YWNobWVudCI6W10sInBhY2thZ2UiOltdLCJhbGxfZmlsZXMiOnRydWV9LHsibmFtZSI6ImtlUHJpbnQiLCJ2ZXJzaW9uIjoiMC4wLjEiLCJzcmMiOnsiZmlsZSI6IlU6L1Ivd2luLWxpYnJhcnkvNC4yL2thYmxlRXh0cmEva2VQcmludC0wLjAuMSJ9LCJtZXRhIjpbXSwic2NyaXB0Ijoia2VQcmludC5qcyIsInN0eWxlc2hlZXQiOltdLCJoZWFkIjpbXSwiYXR0YWNobWVudCI6W10sInBhY2thZ2UiOltdLCJhbGxfZmlsZXMiOnRydWV9LHsibmFtZSI6ImxpZ2h0YWJsZSIsInZlcnNpb24iOiIwLjAuMSIsInNyYyI6eyJmaWxlIjoiVTovUi93aW4tbGlicmFyeS80LjIva2FibGVFeHRyYS9saWdodGFibGUtMC4wLjEifSwibWV0YSI6W10sInNjcmlwdCI6W10sInN0eWxlc2hlZXQiOiJsaWdodGFibGUuY3NzIiwiaGVhZCI6W10sImF0dGFjaG1lbnQiOltdLCJwYWNrYWdlIjpbXSwiYWxsX2ZpbGVzIjp0cnVlfV0sIm1ldGFkYXRhIjp7ImNsYXNzZXMiOlsic2hpbnkudGFnLmxpc3QiXSwic2l6aW5nUG9saWN5IjpbXX19 -->

<table style="NAborder-bottom: 0; width: auto !important; margin-left: auto; margin-right: auto;" class="table">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;">  (1) </th>
   <th style="text-align:center;">   (2) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> (Intercept) </td>
   <td style="text-align:center;"> 8091.783*** </td>
   <td style="text-align:center;"> 10222.882*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (140.310) </td>
   <td style="text-align:center;"> (147.951) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recOriginaires d'Outre-mer </td>
   <td style="text-align:center;"> -3689.683*** </td>
   <td style="text-align:center;"> -1498.901*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (264.580) </td>
   <td style="text-align:center;"> (229.686) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recDescendants d'originaire(s) de l'Outre-mer </td>
   <td style="text-align:center;"> -2418.867*** </td>
   <td style="text-align:center;"> -1270.664** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (521.146) </td>
   <td style="text-align:center;"> (451.195) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recImmigrés d'Algérie, Maroc ou Tunisie </td>
   <td style="text-align:center;"> -4664.234*** </td>
   <td style="text-align:center;"> -1889.573*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (179.804) </td>
   <td style="text-align:center;"> (154.402) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recDescendants d'immigré(s) originaires d'Algérie, du Maroc ou de la Tunisie </td>
   <td style="text-align:center;"> -4184.434*** </td>
   <td style="text-align:center;"> -1928.716*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (172.158) </td>
   <td style="text-align:center;"> (148.125) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recImmigrés d'autres pays d'Afrique </td>
   <td style="text-align:center;"> -4876.401*** </td>
   <td style="text-align:center;"> -1971.302*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (187.383) </td>
   <td style="text-align:center;"> (174.496) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recDescendants d'immigré(s) originaires d'autres pays d'Afrique </td>
   <td style="text-align:center;"> -4745.438*** </td>
   <td style="text-align:center;"> -2035.950*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (212.913) </td>
   <td style="text-align:center;"> (197.230) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recImmigrés d'Asie </td>
   <td style="text-align:center;"> -4548.018*** </td>
   <td style="text-align:center;"> -1973.574*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (264.342) </td>
   <td style="text-align:center;"> (255.556) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recDescendants d'immigré(s) originaires d'Asie </td>
   <td style="text-align:center;"> -3788.867*** </td>
   <td style="text-align:center;"> -1963.680*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (248.522) </td>
   <td style="text-align:center;"> (221.840) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recImmigrés de Turquie ou du Moyen-Orient </td>
   <td style="text-align:center;"> -3958.689*** </td>
   <td style="text-align:center;"> -2397.707*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (263.007) </td>
   <td style="text-align:center;"> (231.825) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recDescendants d'immigré(s) originaires de Turquie ou du Moyen-Orient </td>
   <td style="text-align:center;"> -3031.576*** </td>
   <td style="text-align:center;"> -1313.205*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (310.428) </td>
   <td style="text-align:center;"> (265.052) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recImmigrés du Portugal, d'Espagne ou d'Italie </td>
   <td style="text-align:center;"> -1681.083*** </td>
   <td style="text-align:center;"> -552.005* </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (312.194) </td>
   <td style="text-align:center;"> (254.869) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recDescendants d'immigré(s) originaires du Portugal, d'Espagne ou d'Italie </td>
   <td style="text-align:center;"> -915.443*** </td>
   <td style="text-align:center;"> -594.648** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (231.294) </td>
   <td style="text-align:center;"> (201.529) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recImmigrés d'autres pays d'Europe </td>
   <td style="text-align:center;"> -2329.913*** </td>
   <td style="text-align:center;"> -790.585*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (274.438) </td>
   <td style="text-align:center;"> (223.542) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recDescendants d'immigré(s) originaires d'autres pays d'Europe </td>
   <td style="text-align:center;"> -988.516** </td>
   <td style="text-align:center;"> -557.650* </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (303.961) </td>
   <td style="text-align:center;"> (253.011) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recImmigrés d'autres pays </td>
   <td style="text-align:center;"> -3533.758*** </td>
   <td style="text-align:center;"> -1228.899** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (517.558) </td>
   <td style="text-align:center;"> (387.785) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> origine_tous_g2_recDescendants d'immigré(s) originaires d'autres pays </td>
   <td style="text-align:center;"> -3323.874*** </td>
   <td style="text-align:center;"> -1421.706* </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (670.860) </td>
   <td style="text-align:center;"> (648.706) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> taillevillePlus de 25000 habitants </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> -7122.355*** </td>
  </tr>
  <tr>
   <td style="text-align:left;box-shadow: 0px 1.5px">  </td>
   <td style="text-align:center;box-shadow: 0px 1.5px">  </td>
   <td style="text-align:center;box-shadow: 0px 1.5px"> (160.981) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Num.Obs. </td>
   <td style="text-align:center;"> 27178 </td>
   <td style="text-align:center;"> 27178 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 </td>
   <td style="text-align:center;"> 0.056 </td>
   <td style="text-align:center;"> 0.283 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 Adj. </td>
   <td style="text-align:center;"> 0.056 </td>
   <td style="text-align:center;"> 0.282 </td>
  </tr>
</tbody>
<tfoot><tr><td style="padding: 0; " colspan="100%">
<sup></sup> + p &lt; 0.1, * p &lt; 0.05, ** p &lt; 0.01, *** p &lt; 0.001</td></tr></tfoot>
</table> <script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [["$","$"]]}})</script><script async src="https://mathjax.rstudio.com/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

<!-- rnb-htmlwidget-end -->

```

```{=html}

<!-- rnb-htmlwidget-begin eyJkZXBlbmRlbmNpZXMiOlt7Im5hbWUiOiJqcXVlcnkiLCJ2ZXJzaW9uIjoiMy42LjAiLCJzcmMiOnsiZmlsZSI6IlU6L1Ivd2luLWxpYnJhcnkvNC4yL2pxdWVyeWxpYi9saWIvMy42LjAifSwibWV0YSI6W10sInNjcmlwdCI6ImpxdWVyeS0zLjYuMC5taW4uanMiLCJzdHlsZXNoZWV0IjpbXSwiaGVhZCI6W10sImF0dGFjaG1lbnQiOltdLCJhbGxfZmlsZXMiOnRydWV9LHsibmFtZSI6ImJvb3RzdHJhcCIsInZlcnNpb24iOiIzLjMuNSIsInNyYyI6eyJmaWxlIjoiVTovUi93aW4tbGlicmFyeS80LjIvcm1hcmtkb3duL3JtZC9oL2Jvb3RzdHJhcCJ9LCJtZXRhIjp7InZpZXdwb3J0Ijoid2lkdGg9ZGV2aWNlLXdpZHRoLCBpbml0aWFsLXNjYWxlPTEifSwic2NyaXB0IjpbImpzL2Jvb3RzdHJhcC5taW4uanMiLCJzaGltL2h0bWw1c2hpdi5taW4uanMiLCJzaGltL3Jlc3BvbmQubWluLmpzIl0sInN0eWxlc2hlZXQiOiJjc3MvY29zbW8ubWluLmNzcyIsImhlYWQiOiI8c3R5bGU+aDEge2ZvbnQtc2l6ZTogMzRweDt9XG4gICAgICAgaDEudGl0bGUge2ZvbnQtc2l6ZTogMzhweDt9XG4gICAgICAgaDIge2ZvbnQtc2l6ZTogMzBweDt9XG4gICAgICAgaDMge2ZvbnQtc2l6ZTogMjRweDt9XG4gICAgICAgaDQge2ZvbnQtc2l6ZTogMThweDt9XG4gICAgICAgaDUge2ZvbnQtc2l6ZTogMTZweDt9XG4gICAgICAgaDYge2ZvbnQtc2l6ZTogMTJweDt9XG4gICAgICAgY29kZSB7Y29sb3I6IGluaGVyaXQ7IGJhY2tncm91bmQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMC4wNCk7fVxuICAgICAgIHByZTpub3QoW2NsYXNzXSkgeyBiYWNrZ3JvdW5kLWNvbG9yOiB3aGl0ZSB9PFwvc3R5bGU+IiwiYXR0YWNobWVudCI6W10sInBhY2thZ2UiOltdLCJhbGxfZmlsZXMiOnRydWV9LHsibmFtZSI6ImtlUHJpbnQiLCJ2ZXJzaW9uIjoiMC4wLjEiLCJzcmMiOnsiZmlsZSI6IlU6L1Ivd2luLWxpYnJhcnkvNC4yL2thYmxlRXh0cmEva2VQcmludC0wLjAuMSJ9LCJtZXRhIjpbXSwic2NyaXB0Ijoia2VQcmludC5qcyIsInN0eWxlc2hlZXQiOltdLCJoZWFkIjpbXSwiYXR0YWNobWVudCI6W10sInBhY2thZ2UiOltdLCJhbGxfZmlsZXMiOnRydWV9LHsibmFtZSI6ImxpZ2h0YWJsZSIsInZlcnNpb24iOiIwLjAuMSIsInNyYyI6eyJmaWxlIjoiVTovUi93aW4tbGlicmFyeS80LjIva2FibGVFeHRyYS9saWdodGFibGUtMC4wLjEifSwibWV0YSI6W10sInNjcmlwdCI6W10sInN0eWxlc2hlZXQiOiJsaWdodGFibGUuY3NzIiwiaGVhZCI6W10sImF0dGFjaG1lbnQiOltdLCJwYWNrYWdlIjpbXSwiYWxsX2ZpbGVzIjp0cnVlfV0sIm1ldGFkYXRhIjp7ImNsYXNzZXMiOlsic2hpbnkudGFnLmxpc3QiXSwic2l6aW5nUG9saWN5IjpbXX19 -->

<table style="NAborder-bottom: 0; width: auto !important; margin-left: auto; margin-right: auto;" class="table">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;">  (1) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> (Intercept) </td>
   <td style="text-align:center;"> 8091.783*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (140.310) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> group1Immigré (né étranger à l'étranger y compris réintégrés) </td>
   <td style="text-align:center;"> -3869.197*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (159.710) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> group1Originaire de l'Outre-mer </td>
   <td style="text-align:center;"> -3689.683*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (264.580) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> group1Descendant G2 d'un ou deux immigré-s </td>
   <td style="text-align:center;"> -2788.915*** </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (161.981) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> group1Descendant G2 d'un ou deux originaire-s de l'Outre-mer </td>
   <td style="text-align:center;"> -2418.867*** </td>
  </tr>
  <tr>
   <td style="text-align:left;box-shadow: 0px 1.5px">  </td>
   <td style="text-align:center;box-shadow: 0px 1.5px"> (521.146) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Num.Obs. </td>
   <td style="text-align:center;"> 27178 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 </td>
   <td style="text-align:center;"> 0.047 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 Adj. </td>
   <td style="text-align:center;"> 0.046 </td>
  </tr>
</tbody>
<tfoot><tr><td style="padding: 0; " colspan="100%">
<sup></sup> + p &lt; 0.1, * p &lt; 0.05, ** p &lt; 0.01, *** p &lt; 0.001</td></tr></tfoot>
</table> <script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [["$","$"]]}})</script><script async src="https://mathjax.rstudio.com/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

<!-- rnb-htmlwidget-end -->

```

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


## Plot



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-plot-begin eyJoZWlnaHQiOjQzMi42MzI5LCJ3aWR0aCI6NzAwLCJzaXplX2JlaGF2aW9yIjowLCJjb25kaXRpb25zIjpbXX0= -->

<img src="data:image/png;base64,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" />

<!-- rnb-plot-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->



<!-- rnb-chunk-end -->

