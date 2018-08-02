# Testing `delayed_job`

## Preparation

1. Start Postgres and create the database:

   ```sh
   brew services start postgresql
   createdb delayed-job-test
   ```

1. Configure the database connection:

   ```sh
   export DB=postgres:///delayed-job-test
   ```

1. Run migrations:

   ```sh
   sequel -m db/migrations $DB
   ```

1. Start the job processing daemon:

   ```sh
   ./scripts/process-jobs run
   ```

## On a Happy Day

1. Provide the mail body on `STDIN` and the email addresses as parameters:

   ```sh
   echo "Dear number $RANDOM, you are an awesome number! Best regards; The Computer." | ./scripts/enqueue-job foo@example.com bar@example.org
   ```

   Here, we are sending a letter to foo@example.com and bar@example.org, each as a single job.

1. Verify that the mailer ran (we simulate it by appending to a 'queue' file):

   ```sh
   tail -f log/mail.queue
   ```

   Additional details about the job itself can be found in `log/delayed_job.log`.
