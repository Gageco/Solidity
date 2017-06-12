package main

import (
  "fmt"
  "flag"
  "log"
  "github.com/bot-api/telegram"
  "github.com/bot-api/telegram/telebot"
  "golang.org/x/net/context"
  "bufio"
  "os"
)

func main() {
  inFile, _ os.Open(./config)
  scanner := bufio.NewScanner(inFile)
  scanner.Split(bufio.ScanLines)
  scanner.Scan()
  scanner.Scan()
  telegramToken = scanner.Text()                                                //Line 2

  //Telegram Auth
  token := flag.String("token", telegramToken, "telegram bot token")
  debug := flag.Bool("debug", false, "show debug information")
  flag.Parse()
  if *token == "" {
    fmt.Println("No Token Given")
  }

  api := telegram.New(*token)
  bot := telebot.NewWithAPI(api)
  bot.Use(telebot.Recover())

  netCtx, cancel := context.WithCancel(context.Background())
  defer cancel()
  fmt.Println("Telegram bot has loaded")
  fmt.Println("API Key:", telegramToken)
  //End Telegram Auth

  "start": telebot.CommandFunc(                                                 //start
    func(ctx context.Context, arg string) error {
      api := telebot.GetAPI(ctx)
      update := telebot.GetUpdate(ctx)
      _, err := api.SendMessage(ctx,
        telegram.NewMessagef(update.Chat().ID, startText(),
        ))
      return err
    }),

  "help": telebot.CommandFunc(                                                  //start
    func(ctx context.Context, arg string) error {
      api := telebot.GetAPI(ctx)
      update := telebot.GetUpdate(ctx)
      _, err := api.SendMessage(ctx,
        telegram.NewMessagef(update.Chat().ID, helpCommand(arg),
        ))
      return err
    }),

  "amount": telebot.CommandFunc(                                              //amount
    func(ctx context.Context, arg string) error {
      api := telebot.GetAPI(ctx)
      update := telebot.GetUpdate(ctx)
      _, err := api.SendMessage(ctx,
        telegram.NewMessagef(update.Chat().ID, gethAmount(arg),
        ))
      return err
    }),

  "send": telebot.CommandFunc(                                                //send
      func(ctx context.Context, arg string) error {
      api := telebot.GetAPI(ctx)
      update := telebot.GetUpdate(ctx)
      _, err := api.SendMessage(ctx,
        telegram.NewMessagef(update.Chat().ID, gethSend(arg),
        ))
      return err
    }),

  "": telebot.CommandFunc(                                                    //not valid
    func(ctx context.Context, arg string) error {
      api := telebot.GetAPI(ctx)
      update := telebot.GetUpdate(ctx)
      //command, arg := update.Message.Command()
      _, err := api.SendMessage(ctx,
        telegram.NewMessagef(update.Chat().ID, invalidInput(arg),
        ))
      return err
    }),


}
