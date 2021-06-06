import telebot as tb
import pymongo
import GenerateApp 
import os
import subprocess
from shutil import copyfile
from time import sleep
#####################################################################
# including the global variable in one array in the following order #
# this array represent the commands to be inserted to check for     #
# user input so the bot wont get interrepted by any mistake         #                    
#####################################################################
# [start_command  ,  change_app_name  ,  add  ,  TabBar  ,   number of tabs  ,  Scaffold  ,  generateapp ]
#        0                  1             2        3                  4           5             6
#[input_image , splash_screen  , index of tabs]
#      7            8                   9
CONFIG = [True,False,False,False,0,False,False,False,False,0]
#defining a tab fanction that return a dictionnary of type tabs
def tabs(image,title):
    return{
        "image":image,
        "title" : title
    }
import asyncio


APP={
    "name":"",
    "splash_screen":"",
    "scaffold" : False,
    "tabs":[
    ]
}

if __name__ == "__main__":   

    bot = tb.TeleBot("1810938195:AAFSOqeqRmMDHsxJtGcA1GYRCupjg2pSPIU", parse_mode=None) # You can set parse_mode by default. HTML or MARKDOWN
    print("------bot started------")
    ############################
    #handling the start command#
    ############################
    @bot.message_handler(commands=['start'])
    def send_welcome(message):
        print("start command was inserted")
        print("the inserted message is :",message.text)
        global CONFIG 
        if CONFIG[0]:
            print("replaying to start command ")
            bot.reply_to(message, """
            This Bot will help you create a Flutter application so let's start with the basics 
please enter a Name for the App For exemple:
 /name TheAppName
the name must not start with a number or a symbole
            """)
            CONFIG[0] = False
            CONFIG[1] = True
        else:
            print("start command has already been executed !")
            bot.reply_to(message, """
            you Have already started Please Follow the steps to help create your app correctely
            """)
############
############
############
############
############
############
############
############
############
############
############

    ###########################
    #handling The name Comande#
    ###########################
    @bot.message_handler(commands=['name'])
    def get_app_name(message):
        print("name command was inserted")
        print("the inserted message is :",message.text)
        global CONFIG 
        global APP
        if CONFIG[1]:
            print("replaying to Name command ")
            bot.reply_to(message, """
We have recived the app name Please provide an image for the splash screen
make sure it's a PNG file type
            """)
            #saving the app name
            APP["name"]=message.text[5:]
            #end saving app name
            CONFIG[1] = False#name command has been diactivated 
            CONFIG[8]=True#splash screen option is activated
            CONFIG[2] = True#add commnd has been activated
            print("name command has been executed openning TabBar and Scaffold as options !")

        else:
            print("name command can not be used !")
            bot.reply_to(message, """
            Please Follow the steps to help create your app correctely
            """)

############
############
############
############
############
############
############
############
############
############
############

    ###########################
    #handling The add Comande#
    ###########################
    @bot.message_handler(commands=['add'])
    def get_app_name(message):
        print("add command was inserted")
        print("the inserted message is :",message.text)
        print(message.text[4:])
        global CONFIG
        global APP 
        if CONFIG[2]:
            print("replaying to add command ")
            print
            if message.text[5:] == "TabBar":
                print("TabBar widget was detected and will be aded")
                bot.reply_to(message, """
How many Tabs to you want ?
please enter a number between 3 and 5 to make it simple!
if you finished please enter 
/generateApp to generate the app .
            """)
                CONFIG[2] = False#add commande has been diactivated untill we add the tabs number 
                CONFIG[3] = True#tabbar option has ben activated
                CONFIG[5] = False#Scaffold option has ben diactivated
                CONFIG[7] = True#getting ready for tabs images
                print("TabBar command has been executed we are waiting for the tab numbers !")
            elif message.text[5:] == "Scaffold":
                print("Scaffold widget was detected and will be aded")
                bot.reply_to(message, """
Option has been saved i will create a Scaffold widget for you
if you finished please enter /generateApp to generate the app .

            """)
                #saving scaffold option scaffold
                APP["scaffold"]=True

                CONFIG[3] = False#TabBar option has been diactivated  
                CONFIG[5] = True#Scaffold option has been activated you can add child widget
                print("Scaffold command has been executed we are waiting for the next widget type!")
            else:
                bot.reply_to(message,"I don't understand this option !")

        else:
            print("add command has can not be used now !")
            bot.reply_to(message, """
            Please Follow the steps to help create your app correctely
            """)

############
############
############
############
############
############
############
############
############
############
############
    ###########################
    #handling The generateApp Comande#
    ###########################
    @bot.message_handler(commands=['generateApp'])
    def generate_the_app(message):
        print("generateApp command was inserted")
        global APP
        print(APP)
        print("connecting to mongo db database ....")
        client = pymongo.MongoClient('mongodb+srv://ideapp:ideapp123@mycluster.lytgp.mongodb.net/test?retryWrites=true&w=majority')
        print("connection succesfull")
        db = client.test
        print("inserting the App files")
        db.app.insert_one(APP)
        print("end inserting in database")
        bot.reply_to(message,"""
The app data has been pushed to the database successfully!! i will generate an app for you !
        """)
        print("starting to generate the app !")
        bot.stop_polling()
        GenerateApp.main()
        #starting to compile app
        print("-----------------end generating app files-----------------")
        os.chdir("flutter_docker")
        print("compiling app ")
        
        p=subprocess.Popen("flutter build apk --debug",shell=True,stdout = subprocess.PIPE, stderr = subprocess.PIPE)
        # poll = p.poll()
        # while poll is None:
        #     sleep(10)
        #     print("compiling....")
        # print("end compiling app")
        # os.chdir("..")
        # print("copying files")
        # copyfile("flutter_docker//build//app//outputs//flutter-apk//app-debug.apk","compiled//app.apk")
        # print("end copying file") 
        




    ###########################
    #handling The tab Comande#
    ###########################
    @bot.message_handler(commands=['tab'])
    def get_tab_name(message):
        print("tab command was inserted")
        print("the inserted message is :",message.text)
        global CONFIG 
        global APP
        if CONFIG[4]!=0 and CONFIG[7]==False:
            print("replaying to tab command ")
            bot.reply_to(message, """
We have recived the tab name Please provide the next tab image
            """)
            APP["tabs"][CONFIG[9]]["title"]=message.text[4:]#saving the title for the current 
            #image saved
            CONFIG[9]+=1#adding the index for the tabs
            CONFIG[4]-=1 
            CONFIG[7] = True#image option has been activated
            print("tab command has been executed  !")

        else:
            print("tab command can not be used !")
            bot.reply_to(message, """
if you finished please submit the comande 
/generateApp to generate your app
            """) 

############
############
############
############
############
############
############
############
############
############
############

    ###########################
    #handling The TabBar numbers#
    ###########################
    @bot.message_handler(func=lambda m: True)
    def handle_number_of_tabs(message ):
        global CONFIG
        if message.text.isdigit() and CONFIG[3] and CONFIG[4]==0 :
            print("we detect digit and tab numbers")
            if int(message.text) in (4,5,3):
                bot.reply_to(message,"""
number of tabs is saved please submit an image first then the title for each tab with the 
/tab tab_title
                """)

                CONFIG[4]=int(message.text)
                CONFIG[3]=False#diactivating the tabbar option
                print("Tab numbers was saved")

            else:
                bot.reply_to(message,"""
the numbers is out of range !
                """)
                print("numbers is out of range")
        else:
            print("I can not read the tab numbers right now")

           
############
############
############
############
############
############
############
############
############
############
############

    ###########################
    #handling The tabs imgaes #
    ###########################
    @bot.message_handler(content_types=['photo'])
    def handle_images(message):
        print("an image has been send")
        global APP
        global CONFIG
        if CONFIG[7] and CONFIG[4]!=0:
            print("i can recive and save this image and number of tabs is not 0")
            fileID = message.photo[-1].file_id
            file = bot.get_file(fileID)
            downloaded_file = bot.download_file(file.file_path)
            image_name="assets/image"+str(CONFIG[9])+".jpg"
            with open(image_name, 'wb') as new_file:
                new_file.write(downloaded_file)
            print("image has been succefully saved")
            bot.reply_to(message, """
Please provide a title for this image with the command
/tab tab_tile  
            """)
            #saving tab titles
            APP["tabs"].append(tabs(image_name,""))
            CONFIG[7]=False#diactivating the image option
        elif CONFIG[8]:
            print("i can recive and save this splash screen ")
            fileID = message.photo[-1].file_id
            file = bot.get_file(fileID)
            downloaded_file = bot.download_file(file.file_path)
            #splash screen must be a png type file !
            image_name="assets/splash.png"
            try:
                with open(image_name, 'wb') as new_file:
                    new_file.write(downloaded_file)
            except FileNotFoundError:
                print("a error while loading ...")
                pass
            print("image has been succefully saved")
            bot.reply_to(message, """
spalash screen has been saved  
We have recived the app splashscreen Please chose from the following wich type of widget you want to use
/add TabBar 
/add Scaffold
            """)
            APP["splash_screen"]=image_name
            CONFIG[8]=False#diactivating the image option

        else:
            print("i cann not recive an image ")
            bot.reply_to(message, """
Please Follow the steps to help create your app correctely 
and if you are finishid please type in the cammand
/generateApp to generate your app
            """)













    #adding this polling function allows the script to start listening
    bot.polling()