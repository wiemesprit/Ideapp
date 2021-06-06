import pymongo
from shutil import copyfile
import os
import subprocess


#this function represent a repetetive peace of code we will be entering and changing a lots of files 
#it's a best practice to create a function that can add any countent to any file we want
def change_file_content(file_path,content,line,add_to_line=False):
    print("------changing file ",file_path," ------")
    androidManifest = file_path
    with open(androidManifest, 'r') as file:
        lines = file.readlines()
    if add_to_line:
        lines[line]+=content
    else:
        lines[line]=content
    with open(androidManifest, 'w') as file:
        file.writelines( lines )
    print("------end changing file ",file_path," ------")
    print("------closing file ",file_path," ------")



def main():
    print("connect to mongoDB data base ...")
    client = pymongo.MongoClient('mongodb+srv://ideapp:ideapp123@mycluster.lytgp.mongodb.net/test?retryWrites=true&w=majority')
    print("connection seccusfull")
    db = client.test
    #this query should return the last object inserted in the app collection
    #and this is so we can always generate only the last app inserted in the database
    last_collection = db.app.find().limit(1).sort([('_id',-1)])
    #the find method return an object of type pymongo.cursor and to get the data we must 
    #iterate over the curser
    MYAPP={}
    print(last_collection)
    for element in last_collection:
        MYAPP=element
    print("The APP object : ", MYAPP)
    print(MYAPP["name"])
    print("-----------------changing the app name-----------------")
    ##############################################################################
    #starting by changing the app full name in boath the AndroidManifest.xml file#
    #and tha main.dart file                                                      #
    ##############################################################################
    #changing the app name in AndroidManifest.xml
    path_to_file="flutter_docker//android//app//src//main//AndroidManifest.xml"
    content = '\tandroid:label="{}"\n'.format(MYAPP["name"])
    change_file_content(path_to_file,content,3)
    #we will also change the app name inside the main.dart file
    path_to_file="flutter_docker//lib//main.dart"
    content = 'home: LoginPage("{}"));\n'.format(MYAPP["name"])
    change_file_content(path_to_file,content,11)
    
    ##############################################################################
    #now we will change the splash screen this require copying the .PNG file into#
    #flutter_dcoker/android/app/src/main/res/drawable                            #
    ##############################################################################
    print("-----------------changing the app splash screen-----------------")
    #using the copyfile function from the shutil library if the file is alrady exist 
    #it will be replaced so we dont have to wory about FileExist exception
    copyfile("assets//splash.png","flutter_docker//android//app//src//main//res//drawable-v21//ic_launcher.png")
    copyfile("assets//splash.png","flutter_docker//android//app//src//main//res//drawable//ic_launcher.png")
    print("-----------------end the app splash screen-----------------")    

    ##############################################################################
    #now we can finish copying the files for the tab bar option if it exist or we#
    #will create a scuffuld and if not we will also generate the tabs            #
    ##############################################################################
    print("-----------------generating app files-----------------")
    if MYAPP["scaffold"]:
    #generating a scaffold when the sign in button is pressed in Loin_Screen.dart
        print("generating scaffold widget ")
        path_to_file="flutter_docker//lib//screens//Login_Screen.dart"
        content = 'builder: (context) => {}()));\n'.format("ScaffoldApp")
        change_file_content(path_to_file,content,79)     
         
    else:
        #if the user chose to generate an app with tabs
        print("generating TabBar widget ")
        path_to_file="flutter_docker//lib//screens//Login_Screen.dart"
        content = 'builder: (context) => {}()));\n'.format("GeneratedApp")
        change_file_content(path_to_file,content,79)  
        print("generating TabBar ")
        #it's better to keep a template to work with rather than changing the actual 
        #file diractly
        path_to_file="flutter_docker//lib//screens//generated_app.dart"
        copyfile("assets//generated_app_template.dart",path_to_file)
        change_file_content(path_to_file,"length: {},\n".format(str(len(MYAPP['tabs']))),9)
        for tab in MYAPP['tabs']:
            print("generating tab ")
            #getting tabs data
            #this data will be inserted inside the generated_app.dart file
            generated_tab_text='TabText("{}"),\n'.format(tab['title'])
            generated_tab_image='TabsImage("{}","{}"),\n'.format('asset/'+tab['image'][7:],tab['title'])
            print("coying files tabs image files")
            tab['image'].replace("/","//")
            copyfile(tab['image'],"flutter_docker//asset"+tab['image'][6:])
            #adding tabs_image
            change_file_content(path_to_file,generated_tab_image,24,True)
            #adding tabs_text
            change_file_content(path_to_file,generated_tab_text,16,True)

        print("end generating TabBar ")
    print("-----------------end generating app files-----------------")

