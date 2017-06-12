package main

import (
  "strings"
)

func parseToWords(arg string) (string, string) {
  parsedWords := strings.Fields(arg)

  if len(parsedWords) > 2 {                                                     //if there are to many arguements in the string
    return nil, nil
  } else if len(parsedWords) == 1 {                                             //if there is one arguemetn in the string
    return parsedWords[0], nil
  } else if len(parsedWords) == 2 {
    return parsedWords[0], parsedWords[1]                                       //if there are two words in the string
  } else {                                                                      //if all else fails
    return nil, nil
  }
}

func invalidInput(arg string) string {
  fmt.Println("Invalid Input:",arg)
  return "Invalid Input"
}

func startText() string {
  fmt.Println("Start Command")
  return "This bot is a work in progress"
}

func helpCommand() string {
  fmt.Println("Help Command")
  return "This bot is a work in progress"
}
