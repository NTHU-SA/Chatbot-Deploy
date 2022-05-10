host=127.0.0.1
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection academic_phone --jsonArray --file /mnt/academic_phone.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection admin --jsonArray --file /mnt/admin.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection administration_phone --jsonArray --file /mnt/administration_phone.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection anecdote --jsonArray --file /mnt/anecdote.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection bus_schedule --jsonArray --file /mnt/bus_schedule.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection bus_schedule_summer --jsonArray --file /mnt/bus_schedule_summer.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection epidemic_data --jsonArray --file /mnt/epidemic_data.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection feedback --jsonArray --file /mnt/feedback.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection instanews --jsonArray --file /mnt/instanews.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection ocamp --jsonArray --file /mnt/ocamp.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection ocamp_checkpoint --jsonArray --file /mnt/ocamp_checkpoint.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection ocamp_course --jsonArray --file /mnt/ocamp_course.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection ocamp_game --jsonArray --file /mnt/ocamp_game.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection ocamp_group --jsonArray --file /mnt/ocamp_group.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection qa_data --jsonArray --file /mnt/qa_data.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection token --jsonArray --file /mnt/token.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection user --jsonArray --file /mnt/user.json
mongoimport -u ${MONGO_ACCOUNT} -p ${MONGO_PASS} --authenticationDatabase admin --host $host --db nthu_chatbot_db --collection user_map_record --jsonArray --file /mnt/user_map_record.json

