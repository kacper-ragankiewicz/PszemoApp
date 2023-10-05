CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-------------- USERS

CREATE TABLE IF NOT EXISTS public.user
(
    usr_uuid uuid DEFAULT uuid_generate_v4 (),
    usr_name Varchar(50) NOT NULL,
    usr_lastname Varchar(50) NOT NULL,
    usr_email Varchar(50) NOT NULL,
    usr_pass Varchar(200) NOT NULL,
    PRIMARY KEY (usr_uuid)
)
TABLESPACE pg_default;

INSERT INTO public.user (usr_name, usr_lastname, usr_email, usr_pass )
SELECT 'Test', 'Testowy', 'test@gmail.com', '$2a$12$4mD1bQdOuSeo3lzOs4BBhuL4LIBm03wf3MIyoXIeX2Z6yWXu8TJku';
-- PASSWORD: test01