while getopts e:o:u: option
do
    case "${option}"
    in
    e)  ENVIRONMENT=${OPTARG};;
    o)  OPERATION=${OPTARG};;
    u)  USER=${OPTARG};;
    esac
done

sfdx force:auth:jwt:grant --clientid $ENVIRONMENT --jwtkeyfile assets/server.key --username $USER --setdefaultdevhubusername -a DevHub
sfdx force:source:convert -d temp_metadata/ -n Travis_CI_Package
if [ "$OPERATION" = "TestOnly" ]; then
    echo "Running Validation against" $ENVIRONMENT
    sfdx force:mdapi:deploy -c -l RunLocalTests -d temp_metadata/ -u DevHub -w 10
fi
if [ "$OPERATION" = "Deploy" ]; then
    echo "Running Validation"
    sfdx force:mdapi:deploy -c -l RunLocalTests -d temp_metadata/ -u DevHub -w 10
    echo "Running Deployment"
    sfdx force:mdapi:deploy -l RunLocalTests -d temp_metadata/ -u DevHub -w 10    
fi