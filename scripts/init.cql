create keyspace crowdfunding with replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

CREATE TABLE crowdfunding.users
(
    login TEXT PRIMARY KEY,
    password TEXT,
    about TEXT,
    first_name TEXT,
    last_name TEXT,
    patronymic TEXT,
    birth_date DATE,
    balance INT,
    user_id UUID,
    projects SET<UUID>,
    roles SET<TEXT>
);

CREATE TABLE crowdfunding.projects
(
    project_id UUID PRIMARY KEY,
    project_name TEXT,
    author_login TEXT,
    description TEXT,
    donation_deadline DATE,
    video_widget TEXT,
    required_amount INT,
    collected_amount INT,
    category TEXT,
    givers MAP<TEXT, INT>
);

CREATE TABLE crowdfunding.project_names_for_id
(
    project_id UUID,
    project_name TEXT PRIMARY KEY ,
);

CREATE TABLE crowdfunding.projects_by_req_amount_asc
(
    project_id UUID,
    project_name TEXT,
    author_login TEXT,
    description TEXT,
    donation_deadline DATE,
    required_amount INT,
    collected_amount INT,
    category TEXT,
    PRIMARY KEY ( (category), required_amount, project_id )
) WITH CLUSTERING ORDER BY (required_amount ASC) and comment = 'Проекты по категории в порядке возрастания суммы сбора';

CREATE TABLE crowdfunding.projects_by_req_amount_desc
(
    project_id UUID,
    project_name TEXT,
    author_login TEXT,
    description TEXT,
    donation_deadline DATE,
    required_amount INT,
    collected_amount INT,
    category TEXT,
    PRIMARY KEY ( (category), required_amount, project_id )
) WITH CLUSTERING ORDER BY (required_amount DESC) and comment = 'Проекты по категории в порядке убывания суммы сбора';

CREATE TABLE crowdfunding.projects_by_deadline_asc
(
    project_id UUID,
    project_name TEXT,
    author_login TEXT,
    description TEXT,
    donation_deadline DATE,
    required_amount INT,
    collected_amount INT,
    category TEXT,
    PRIMARY KEY ( (category), donation_deadline, project_id )
) WITH CLUSTERING ORDER BY (donation_deadline ASC) and comment = 'Проекты по категории в порядке возрастания даты окончания сбора';

CREATE TABLE crowdfunding.projects_by_deadline_desc
(
    project_id UUID,
    project_name TEXT,
    author_login TEXT,
    description TEXT,
    donation_deadline DATE,
    required_amount INT,
    collected_amount INT,
    category TEXT,
    PRIMARY KEY ( (category), donation_deadline, project_id )
) WITH CLUSTERING ORDER BY (donation_deadline DESC) and comment = 'Проекты по категории в порядке убывания даты окончания сбора';


CREATE TABLE crowdfunding.promo_codes
(
    promo_code TEXT primary key,
    amount INT
);
