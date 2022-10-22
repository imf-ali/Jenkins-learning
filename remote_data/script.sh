DB_HOST=$1
DB_PASSWD=$2
DB_NAME=$3
AWS_KEY=$4
BUCKET=$5
DATE=$(date +%H-%M-%S)

mysqldump -u root -h $DB_HOST -p$DB_PASSWD $DB_NAME > tmp/db-$DATE.sql && \
export AWS_ACCESS_KEY_ID=AKIA2JN2W36S7B4PDMDH && \
export AWS_SECRET_ACCESS_KEY=$AWS_KEY && \
echo "Uploading the db on aws s3" && \
aws s3 cp /tmp/db-$DATE.sql s3://$BUCKET/db-$DATE.sql