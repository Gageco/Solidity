package main

import (

)

func gethAmount(arg string) string {
  word01, word02 := parseToWords(arg)
  if word01 == nil && word02 == nil {
    //get amount in senders account with some dictionary or something
  } else if word01 != nil && word02 == nil {
    //get amount from address word01
  } else if word01 != nil && word02 != nil {
    return "To many arguments"
  }
  return "Sorry not valid"
}

func gethSend(arg string) string {
  word01, word02 := parseToWords(arg)
  if word01 == nil && word02 == nil {
    return "Not enough arguments"
  } else if word01 != nil && word02 == nil {
    return "Not enought arguments"
  } else if word01 != nil && word02 != nil {
    //send tokens form word01 to word02
  }
  return "Sorry not valid"
}
