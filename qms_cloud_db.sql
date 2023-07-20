--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: camsdb; Type: SCHEMA; Schema: -; Owner: cams
--

CREATE SCHEMA camsdb;


ALTER SCHEMA camsdb OWNER TO cams;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = camsdb, pg_catalog;

--
-- Name: _hr_dept_training_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE _hr_dept_training_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb._hr_dept_training_id_seq OWNER TO cams;

--
-- Name: _hr_training_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE _hr_training_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb._hr_training_id_seq OWNER TO cams;

--
-- Name: _pending_mail_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE _pending_mail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb._pending_mail_id_seq OWNER TO cams;

--
-- Name: adhoc_role_applicant_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE adhoc_role_applicant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.adhoc_role_applicant_id_seq OWNER TO cams;

--
-- Name: adhoc_role_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE adhoc_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.adhoc_role_id_seq OWNER TO cams;

--
-- Name: admin_config_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE admin_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.admin_config_id_seq OWNER TO cams;

--
-- Name: audit_log_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE audit_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.audit_log_id_seq OWNER TO cams;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cams_adhoc_role_applicants_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_adhoc_role_applicants_mapping (
    adhoc_role_applicant_id integer DEFAULT nextval('adhoc_role_applicant_id_seq'::regclass) NOT NULL,
    adhoc_role_id integer NOT NULL,
    emp_id integer NOT NULL,
    site_id integer
);


ALTER TABLE camsdb.cams_adhoc_role_applicants_mapping OWNER TO cams;

--
-- Name: cams_adhoc_role_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_adhoc_role_master (
    adhoc_role_id integer DEFAULT nextval('adhoc_role_id_seq'::regclass) NOT NULL,
    adhoc_role_name character varying(100) NOT NULL
);


ALTER TABLE camsdb.cams_adhoc_role_master OWNER TO cams;

--
-- Name: cams_adhoc_role_permission_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_adhoc_role_permission_mapping (
    id integer NOT NULL,
    adhoc_role_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE camsdb.cams_adhoc_role_permission_mapping OWNER TO cams;

--
-- Name: cams_adhoc_role_permission_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_adhoc_role_permission_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_adhoc_role_permission_mapping_id_seq OWNER TO cams;

--
-- Name: cams_adhoc_role_permission_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE cams_adhoc_role_permission_mapping_id_seq OWNED BY cams_adhoc_role_permission_mapping.id;


--
-- Name: cams_admin_config; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_admin_config (
    admin_config_id integer NOT NULL,
    site_id integer,
    module_id integer,
    config_key character varying(200),
    config_value character varying(200),
    config_group character varying(200),
    control_type character varying(200),
    regex text,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE camsdb.cams_admin_config OWNER TO cams;

--
-- Name: cams_admin_config_admin_config_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_admin_config_admin_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_admin_config_admin_config_id_seq OWNER TO cams;

--
-- Name: cams_admin_config_admin_config_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE cams_admin_config_admin_config_id_seq OWNED BY cams_admin_config.admin_config_id;


--
-- Name: cams_audit_log_entity; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_audit_log_entity (
    audit_log_id integer DEFAULT nextval('audit_log_id_seq'::regclass) NOT NULL,
    audit_action character varying(200),
    audit_details text,
    audit_entity character varying(50),
    audit_date timestamp without time zone,
    audit_by character varying(50),
    sub_id character varying(100),
    pk_id integer,
    site_id integer DEFAULT 1
);


ALTER TABLE camsdb.cams_audit_log_entity OWNER TO cams;

--
-- Name: cams_audit_log_entity_audit_log_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_audit_log_entity_audit_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_audit_log_entity_audit_log_id_seq OWNER TO cams;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.client_id_seq OWNER TO cams;

--
-- Name: cams_client_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_client_master (
    client_id integer DEFAULT nextval('client_id_seq'::regclass) NOT NULL,
    client_name text NOT NULL,
    activation_date date NOT NULL,
    licensing_firm text NOT NULL,
    license_number character varying(300) NOT NULL,
    client_activation boolean NOT NULL,
    activated_by character varying(100) NOT NULL,
    activation_time time without time zone NOT NULL
);


ALTER TABLE camsdb.cams_client_master OWNER TO cams;

--
-- Name: module_client_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE module_client_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.module_client_mapping_id_seq OWNER TO cams;

--
-- Name: cams_client_module_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_client_module_mapping (
    module_client_mapping_id integer DEFAULT nextval('module_client_mapping_id_seq'::regclass) NOT NULL,
    module_id integer NOT NULL,
    client_id integer NOT NULL,
    mapped_date date NOT NULL
);


ALTER TABLE camsdb.cams_client_module_mapping OWNER TO cams;

--
-- Name: dept_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE dept_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.dept_id_seq OWNER TO cams;

--
-- Name: cams_department_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_department_master (
    dept_id integer DEFAULT nextval('dept_id_seq'::regclass) NOT NULL,
    dept_name character varying(250) NOT NULL,
    isactive boolean NOT NULL,
    parent_id integer,
    deactivated_by integer,
    deactivation_comment character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE camsdb.cams_department_master OWNER TO cams;

--
-- Name: designation_group_maping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE designation_group_maping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.designation_group_maping_id_seq OWNER TO cams;

--
-- Name: cams_designation_group_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_designation_group_mapping (
    designation_group_maping_id integer DEFAULT nextval('designation_group_maping_id_seq'::regclass) NOT NULL,
    group_id integer NOT NULL,
    desig_id integer NOT NULL,
    isactive boolean,
    deactivated_by integer,
    deactivation_comment character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE camsdb.cams_designation_group_mapping OWNER TO cams;

--
-- Name: desig_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE desig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.desig_id_seq OWNER TO cams;

--
-- Name: cams_designation_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_designation_master (
    desig_id integer DEFAULT nextval('desig_id_seq'::regclass) NOT NULL,
    desg_name character varying(150) NOT NULL,
    isactive boolean NOT NULL,
    deactivated_by integer,
    deactivation_comment character varying(100) DEFAULT NULL::character varying,
    site_id integer
);


ALTER TABLE camsdb.cams_designation_master OWNER TO cams;

--
-- Name: doc_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.doc_id_seq OWNER TO cams;

--
-- Name: cams_document_mstr; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_document_mstr (
    doc_id integer DEFAULT nextval('doc_id_seq'::regclass) NOT NULL,
    upload_date date NOT NULL,
    uploaded_doc bytea,
    uploaded_by integer NOT NULL
);


ALTER TABLE camsdb.cams_document_mstr OWNER TO cams;

--
-- Name: cams_email_queue_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_email_queue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_email_queue_id_seq OWNER TO cams;

--
-- Name: cams_email_queue; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_email_queue (
    id integer DEFAULT nextval('cams_email_queue_id_seq'::regclass) NOT NULL,
    jbpm_task_id bigint,
    cams_task_id bigint,
    status integer NOT NULL,
    module_name character varying(50),
    description text,
    mail_type integer,
    user_name text,
    group_name text,
    recipients text,
    subject text
);


ALTER TABLE camsdb.cams_email_queue OWNER TO cams;

--
-- Name: cams_employe_hire_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_employe_hire_mapping (
    emp_hire_id integer NOT NULL,
    tracking_id integer NOT NULL,
    emp_id integer NOT NULL,
    site_id integer
);


ALTER TABLE camsdb.cams_employe_hire_mapping OWNER TO cams;

--
-- Name: cams_employe_hire_mapping_emp_hire_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_employe_hire_mapping_emp_hire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_employe_hire_mapping_emp_hire_id_seq OWNER TO cams;

--
-- Name: cams_employe_hire_mapping_emp_hire_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE cams_employe_hire_mapping_emp_hire_id_seq OWNED BY cams_employe_hire_mapping.emp_hire_id;


--
-- Name: cams_hire_tracking_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_hire_tracking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_hire_tracking_id_seq OWNER TO cams;

--
-- Name: cams_employee_hire_status; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_employee_hire_status (
    tracking_id integer DEFAULT nextval('cams_hire_tracking_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    emp_recruitment_status character varying(50) NOT NULL,
    version_no integer,
    emp_jd_created_date timestamp without time zone,
    emp_hod_jdacceptence_date timestamp without time zone,
    emp_jd_acceptence_date timestamp without time zone,
    task_id integer,
    site_id integer
);


ALTER TABLE camsdb.cams_employee_hire_status OWNER TO cams;

--
-- Name: emp_maping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE emp_maping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.emp_maping_id_seq OWNER TO cams;

--
-- Name: cams_employee_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_employee_mapping (
    emp_maping_id integer DEFAULT nextval('emp_maping_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    desig_id integer,
    dept_id integer,
    site_id integer NOT NULL,
    is_allocated_induction boolean,
    reporting_mgr integer,
    deactivated_date date,
    deactivation_comment text,
    deactivated_by integer,
    is_active boolean DEFAULT true,
    is_trainer boolean DEFAULT false
);


ALTER TABLE camsdb.cams_employee_mapping OWNER TO cams;

--
-- Name: emp_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE emp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.emp_id_seq OWNER TO cams;

--
-- Name: cams_employee_mstr; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_employee_mstr (
    emp_id integer DEFAULT nextval('emp_id_seq'::regclass) NOT NULL,
    emp_id_company character varying(50) NOT NULL,
    emp_name character varying(40) NOT NULL,
    emp_surname character varying(30) NOT NULL,
    phonenumber character varying(50),
    email_id character varying(45) NOT NULL,
    date_of_joining date NOT NULL,
    isactive boolean NOT NULL,
    password text DEFAULT 'NULL::character varying'::character varying,
    activation_date date,
    deactivation_date date,
    resigned boolean,
    isreplacing boolean NOT NULL,
    replaced_to character varying(15) DEFAULT 'NULL::character varying'::character varying,
    salutation character varying(5) NOT NULL,
    emp_middlle_name character varying(20),
    qualification character varying(100) NOT NULL,
    exp_years real NOT NULL,
    password_status boolean DEFAULT false NOT NULL,
    isnew boolean DEFAULT false,
    pwd_change_date date,
    is_allocated_induction boolean,
    employe_creation_date date,
    pass1 text,
    pass2 text,
    pass3 text,
    is_blocked boolean DEFAULT false,
    block_time timestamp without time zone,
    login_counter integer,
    training_manager integer,
    reporting_manager integer,
    deactivated_by integer,
    deactivation_comment character varying(100) DEFAULT NULL::character varying,
    is_trainer boolean DEFAULT false,
    doc_id integer,
    pwdresetdate date,
    prefered_lang character varying(200)
);


ALTER TABLE camsdb.cams_employee_mstr OWNER TO cams;

--
-- Name: emp_pic_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE emp_pic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.emp_pic_id_seq OWNER TO cams;

--
-- Name: cams_employee_picture_mstr; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_employee_picture_mstr (
    emp_pic_id integer DEFAULT nextval('emp_pic_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    picture bytea
);


ALTER TABLE camsdb.cams_employee_picture_mstr OWNER TO cams;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.role_id_seq OWNER TO cams;

--
-- Name: cams_employee_role_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_employee_role_mapping (
    role_id integer DEFAULT nextval('role_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    site_id integer NOT NULL,
    dept_id integer NOT NULL,
    desig_id integer NOT NULL
);


ALTER TABLE camsdb.cams_employee_role_mapping OWNER TO cams;

--
-- Name: emp_trnr_certifcation_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE emp_trnr_certifcation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.emp_trnr_certifcation_id_seq OWNER TO cams;

--
-- Name: cams_employee_trainer_certification; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_employee_trainer_certification (
    emp_trnr_certifcation_id integer DEFAULT nextval('emp_trnr_certifcation_id_seq'::regclass) NOT NULL,
    ref_id integer NOT NULL,
    certification_title character varying(300) NOT NULL,
    is_emp boolean
);


ALTER TABLE camsdb.cams_employee_trainer_certification OWNER TO cams;

--
-- Name: group_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.group_id_seq OWNER TO cams;

--
-- Name: cams_group_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_group_master (
    group_id integer DEFAULT nextval('group_id_seq'::regclass) NOT NULL,
    group_name character varying(100) NOT NULL,
    group_status boolean NOT NULL
);


ALTER TABLE camsdb.cams_group_master OWNER TO cams;

--
-- Name: cams_label_resources; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_label_resources (
    resource_key character varying(100) NOT NULL,
    resource_value character varying(300),
    lang character varying(5) NOT NULL
);


ALTER TABLE camsdb.cams_label_resources OWNER TO cams;

--
-- Name: cams_login_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_login_master (
    id integer NOT NULL,
    user_id integer,
    authentication_token character varying(255),
    ip_address character varying(255),
    device_type character varying(255),
    login_time timestamp without time zone,
    browser character varying(1024),
    client_os character varying(255),
    db_link character varying(255)
);


ALTER TABLE camsdb.cams_login_master OWNER TO cams;

--
-- Name: cams_login_master_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_login_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_login_master_id_seq OWNER TO cams;

--
-- Name: cams_login_master_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE cams_login_master_id_seq OWNED BY cams_login_master.id;


--
-- Name: mail_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE mail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.mail_id_seq OWNER TO cams;

--
-- Name: cams_mail; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_mail (
    mail_id integer DEFAULT nextval('mail_id_seq'::regclass) NOT NULL,
    recipient integer NOT NULL,
    sender integer,
    date_time timestamp without time zone NOT NULL,
    mail_type character varying(20) NOT NULL,
    info text
);


ALTER TABLE camsdb.cams_mail OWNER TO cams;

--
-- Name: mail_site_scheduler_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE mail_site_scheduler_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.mail_site_scheduler_id_seq OWNER TO cams;

--
-- Name: cams_mail_site_scheduler; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_mail_site_scheduler (
    mail_site_scheduler_id integer DEFAULT nextval('mail_site_scheduler_id_seq'::regclass) NOT NULL,
    site_id integer NOT NULL,
    hour integer DEFAULT 9,
    isactive boolean DEFAULT false
);


ALTER TABLE camsdb.cams_mail_site_scheduler OWNER TO cams;

--
-- Name: module_emp_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE module_emp_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.module_emp_mapping_id_seq OWNER TO cams;

--
-- Name: cams_module_emp_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_module_emp_mapping (
    module_emp_mapping_id integer DEFAULT nextval('module_emp_mapping_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    module_client_mapping_id integer NOT NULL,
    is_active boolean NOT NULL,
    created_date date NOT NULL,
    created_by integer NOT NULL,
    updated_date date NOT NULL,
    updated_by integer NOT NULL,
    site_id integer DEFAULT 1
);


ALTER TABLE camsdb.cams_module_emp_mapping OWNER TO cams;

--
-- Name: module_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE module_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.module_id_seq OWNER TO cams;

--
-- Name: cams_module_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_module_master (
    module_id integer DEFAULT nextval('module_id_seq'::regclass) NOT NULL,
    module_name text NOT NULL,
    module_added_date date NOT NULL,
    module_added_by integer NOT NULL,
    module_mapped_users integer NOT NULL
);


ALTER TABLE camsdb.cams_module_master OWNER TO cams;

--
-- Name: cams_module_resource_designation_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_module_resource_designation_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_module_resource_designation_mapping_id_seq OWNER TO cams;

--
-- Name: cams_module_resource_designation_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_module_resource_designation_mapping (
    module_resource_designation_mapping_id integer DEFAULT nextval('cams_module_resource_designation_mapping_id_seq'::regclass) NOT NULL,
    module_id integer NOT NULL,
    resource_id integer NOT NULL,
    designation_id integer NOT NULL,
    is_active boolean
);


ALTER TABLE camsdb.cams_module_resource_designation_mapping OWNER TO cams;

--
-- Name: module_resource_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE module_resource_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.module_resource_mapping_id_seq OWNER TO cams;

--
-- Name: cams_module_resource_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_module_resource_mapping (
    module_resource_mapping_id integer DEFAULT nextval('module_resource_mapping_id_seq'::regclass) NOT NULL,
    resource_id integer NOT NULL,
    module_client_mapping_id integer NOT NULL
);


ALTER TABLE camsdb.cams_module_resource_mapping OWNER TO cams;

--
-- Name: cams_module_tab_adhocrole_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_module_tab_adhocrole_mapping (
    cams_module_tab_adhocrole_mapping_id integer NOT NULL,
    module_id integer NOT NULL,
    tab_id integer NOT NULL,
    adhoc_role_id integer NOT NULL,
    is_active boolean,
    child_tab text,
    site_id integer DEFAULT 1
);


ALTER TABLE camsdb.cams_module_tab_adhocrole_mapping OWNER TO cams;

--
-- Name: cams_module_tab_adhocrole_map_cams_module_tab_adhocrole_map_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_module_tab_adhocrole_map_cams_module_tab_adhocrole_map_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_module_tab_adhocrole_map_cams_module_tab_adhocrole_map_seq OWNER TO cams;

--
-- Name: cams_module_tab_adhocrole_map_cams_module_tab_adhocrole_map_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE cams_module_tab_adhocrole_map_cams_module_tab_adhocrole_map_seq OWNED BY cams_module_tab_adhocrole_mapping.cams_module_tab_adhocrole_mapping_id;


--
-- Name: cams_module_tab_designation_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_module_tab_designation_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_module_tab_designation_mapping_id_seq OWNER TO cams;

--
-- Name: cams_module_tab_designation_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_module_tab_designation_mapping (
    module_tab_designation_mapping_id integer DEFAULT nextval('cams_module_tab_designation_mapping_id_seq'::regclass) NOT NULL,
    module_id integer NOT NULL,
    tab_id integer NOT NULL,
    designation_id integer NOT NULL,
    is_active boolean
);


ALTER TABLE camsdb.cams_module_tab_designation_mapping OWNER TO cams;

--
-- Name: module_tab_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE module_tab_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.module_tab_mapping_id_seq OWNER TO cams;

--
-- Name: cams_module_tab_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_module_tab_mapping (
    module_tab_mapping_id integer DEFAULT nextval('module_tab_mapping_id_seq'::regclass) NOT NULL,
    tab_id integer NOT NULL,
    module_client_mapping_id integer NOT NULL
);


ALTER TABLE camsdb.cams_module_tab_mapping OWNER TO cams;

--
-- Name: cams_pending_mail; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_pending_mail (
    mail_id integer DEFAULT nextval('_pending_mail_id_seq'::regclass) NOT NULL,
    date_of_mail_failure date NOT NULL,
    mail_recipient character varying(2000) NOT NULL,
    mail_subject character varying(2000),
    mail_content text NOT NULL
);


ALTER TABLE camsdb.cams_pending_mail OWNER TO cams;

--
-- Name: cams_permission_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_permission_master (
    id integer NOT NULL,
    permission_type character varying(200)
);


ALTER TABLE camsdb.cams_permission_master OWNER TO cams;

--
-- Name: cams_permission_master_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_permission_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_permission_master_id_seq OWNER TO cams;

--
-- Name: cams_permission_master_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE cams_permission_master_id_seq OWNED BY cams_permission_master.id;


--
-- Name: cams_pwd_answer; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_pwd_answer (
    emp_id integer NOT NULL,
    pwd_question_id integer NOT NULL,
    answer character varying(300)
);


ALTER TABLE camsdb.cams_pwd_answer OWNER TO cams;

--
-- Name: pwd_question_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE pwd_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.pwd_question_id_seq OWNER TO cams;

--
-- Name: cams_pwd_question_mstr; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_pwd_question_mstr (
    pwd_question_id integer DEFAULT nextval('pwd_question_id_seq'::regclass) NOT NULL,
    question_name character varying(300),
    answer character varying(300)
);


ALTER TABLE camsdb.cams_pwd_question_mstr OWNER TO cams;

--
-- Name: resource_emp_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE resource_emp_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.resource_emp_mapping_id_seq OWNER TO cams;

--
-- Name: cams_resource_emp_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_resource_emp_mapping (
    resource_emp_mapping_id integer DEFAULT nextval('resource_emp_mapping_id_seq'::regclass) NOT NULL,
    module_resource_mapping_id integer NOT NULL,
    emp_id integer NOT NULL,
    access boolean NOT NULL,
    status boolean NOT NULL
);


ALTER TABLE camsdb.cams_resource_emp_mapping OWNER TO cams;

--
-- Name: resource_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.resource_id_seq OWNER TO cams;

--
-- Name: cams_resource_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_resource_master (
    resource_id integer DEFAULT nextval('resource_id_seq'::regclass) NOT NULL,
    resource_name character varying(45) NOT NULL,
    filename character varying(30) NOT NULL,
    icon character varying(30) NOT NULL,
    panelid integer NOT NULL,
    is_active boolean
);


ALTER TABLE camsdb.cams_resource_master OWNER TO cams;

--
-- Name: site_dept_mpng_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE site_dept_mpng_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.site_dept_mpng_id_seq OWNER TO cams;

--
-- Name: cams_site_deparment_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_site_deparment_mapping (
    site_dept_mpng_id integer DEFAULT nextval('site_dept_mpng_id_seq'::regclass) NOT NULL,
    site_id integer NOT NULL,
    dept_id integer NOT NULL,
    dept_head integer,
    is_active boolean,
    deactivated_by integer,
    deactivation_comment character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE camsdb.cams_site_deparment_mapping OWNER TO cams;

--
-- Name: site_dept_desig_group_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE site_dept_desig_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.site_dept_desig_group_id_seq OWNER TO cams;

--
-- Name: cams_site_department_designation_group_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_site_department_designation_group_mapping (
    site_dept_desig_group_id integer DEFAULT nextval('site_dept_desig_group_id_seq'::regclass) NOT NULL,
    site_id integer NOT NULL,
    dept_id integer NOT NULL,
    desig_id integer NOT NULL,
    group_id integer NOT NULL,
    deactivated_by integer,
    deactivation_comment character varying(100) DEFAULT NULL::character varying,
    is_active boolean
);


ALTER TABLE camsdb.cams_site_department_designation_group_mapping OWNER TO cams;

--
-- Name: site_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.site_id_seq OWNER TO cams;

--
-- Name: cams_site_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_site_master (
    site_id integer DEFAULT nextval('site_id_seq'::regclass) NOT NULL,
    site_name character varying(100) NOT NULL,
    site_location character varying(100) NOT NULL,
    isactive boolean NOT NULL,
    phone_number character varying(50) NOT NULL,
    address character varying(100) NOT NULL,
    fax_no character varying(50) NOT NULL,
    city character varying(50),
    site_state character varying(50),
    country character varying(50),
    pincode character varying(50),
    short_name text
);


ALTER TABLE camsdb.cams_site_master OWNER TO cams;

--
-- Name: tab_desig_maping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tab_desig_maping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tab_desig_maping_id_seq OWNER TO cams;

--
-- Name: cams_tab_designation_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_tab_designation_mapping (
    tab_desig_maping_id integer DEFAULT nextval('tab_desig_maping_id_seq'::regclass) NOT NULL,
    desig_id integer NOT NULL,
    tab_id integer NOT NULL,
    status boolean
);


ALTER TABLE camsdb.cams_tab_designation_mapping OWNER TO cams;

--
-- Name: tab_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tab_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tab_id_seq OWNER TO cams;

--
-- Name: cams_tab_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_tab_master (
    tab_id integer DEFAULT nextval('tab_id_seq'::regclass) NOT NULL,
    tab_name character varying(45) NOT NULL,
    filename character varying(50),
    is_active boolean,
    index integer DEFAULT 0 NOT NULL,
    child_tab text
);


ALTER TABLE camsdb.cams_tab_master OWNER TO cams;

--
-- Name: cams_translation; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_translation (
    id integer NOT NULL,
    translation_key character varying(200) NOT NULL,
    translation_value text NOT NULL,
    translation_language character varying(5) NOT NULL
);


ALTER TABLE camsdb.cams_translation OWNER TO cams;

--
-- Name: cams_translation_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_translation_id_seq OWNER TO cams;

--
-- Name: cams_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE cams_translation_id_seq OWNED BY cams_translation.id;


--
-- Name: cams_user_task; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_user_task (
    id integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    title text NOT NULL,
    description text,
    module_name character varying(50) NOT NULL,
    actions text,
    status integer NOT NULL,
    site_id integer,
    resource_key character varying(200)
);


ALTER TABLE camsdb.cams_user_task OWNER TO cams;

--
-- Name: cams_user_task_assignes; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE cams_user_task_assignes (
    assign_id integer NOT NULL,
    task_id integer NOT NULL,
    task_type character varying(10) NOT NULL,
    owner character varying(200) NOT NULL
);


ALTER TABLE camsdb.cams_user_task_assignes OWNER TO cams;

--
-- Name: cams_user_task_assignes_assign_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_user_task_assignes_assign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_user_task_assignes_assign_id_seq OWNER TO cams;

--
-- Name: cams_user_task_assignes_assign_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE cams_user_task_assignes_assign_id_seq OWNED BY cams_user_task_assignes.assign_id;


--
-- Name: cams_user_task_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE cams_user_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.cams_user_task_id_seq OWNER TO cams;

--
-- Name: cams_user_task_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE cams_user_task_id_seq OWNED BY cams_user_task.id;


--
-- Name: emp_role_maping_id; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE emp_role_maping_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.emp_role_maping_id OWNER TO cams;

--
-- Name: emp_sop_training_maping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE emp_sop_training_maping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.emp_sop_training_maping_id_seq OWNER TO cams;

--
-- Name: emp_tni_trainer_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE emp_tni_trainer_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.emp_tni_trainer_mapping_id_seq OWNER TO cams;

--
-- Name: emp_training_attendance_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE emp_training_attendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.emp_training_attendance_id_seq OWNER TO cams;

--
-- Name: employee_sop_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE employee_sop_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.employee_sop_mapping_id_seq OWNER TO cams;

--
-- Name: employee_tni_training_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE employee_tni_training_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.employee_tni_training_mapping_id_seq OWNER TO cams;

--
-- Name: employee_training_certificate_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE employee_training_certificate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.employee_training_certificate_id_seq OWNER TO cams;

--
-- Name: hr_department_trainer_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE hr_department_trainer_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.hr_department_trainer_mapping_id_seq OWNER TO cams;

--
-- Name: live_sop_test_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE live_sop_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.live_sop_test_id_seq OWNER TO cams;

--
-- Name: seq_user_tasks; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE seq_user_tasks
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.seq_user_tasks OWNER TO cams;

--
-- Name: sop_approval_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_approval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_approval_id_seq OWNER TO cams;

--
-- Name: sop_blocked_test_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_blocked_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_blocked_test_id_seq OWNER TO cams;

--
-- Name: sop_category_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_category_id_seq OWNER TO cams;

--
-- Name: sop_category_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_category_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_category_mapping_id_seq OWNER TO cams;

--
-- Name: sop_department_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_department_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_department_mapping_id_seq OWNER TO cams;

--
-- Name: sop_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_id_seq OWNER TO cams;

--
-- Name: sop_image_master_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_image_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_image_master_id_seq OWNER TO cams;

--
-- Name: sop_media_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_media_id_seq OWNER TO cams;

--
-- Name: sop_question_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_question_id_seq OWNER TO cams;

--
-- Name: sop_question_option_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_question_option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_question_option_id_seq OWNER TO cams;

--
-- Name: sop_site_department_group_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_site_department_group_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_site_department_group_mapping_id_seq OWNER TO cams;

--
-- Name: sop_test_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_test_id_seq OWNER TO cams;

--
-- Name: sop_training_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_training_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_training_id_seq OWNER TO cams;

--
-- Name: sop_version_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE sop_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.sop_version_id_seq OWNER TO cams;

--
-- Name: stgemployee; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE stgemployee (
    empid character varying(150),
    salutation character varying(10),
    fname character varying(150),
    mname character varying(150),
    lname character varying(150),
    contactno numeric,
    qualification character varying(150),
    experience numeric,
    doj character varying(150),
    email character varying(150),
    department character varying(150),
    desgination character varying(150),
    roles1 character varying(150),
    roles2 character varying(150),
    certificate character varying(150)
);


ALTER TABLE camsdb.stgemployee OWNER TO cams;

--
-- Name: test_doc_seq_id; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE test_doc_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.test_doc_seq_id OWNER TO cams;

--
-- Name: tni_category_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tni_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tni_category_id_seq OWNER TO cams;

--
-- Name: tni_category_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tni_category_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tni_category_mapping_id_seq OWNER TO cams;

--
-- Name: tni_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tni_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tni_id_seq OWNER TO cams;

--
-- Name: tni_image_master_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tni_image_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tni_image_master_id_seq OWNER TO cams;

--
-- Name: tni_question_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tni_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tni_question_id_seq OWNER TO cams;

--
-- Name: tni_question_option_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tni_question_option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tni_question_option_id_seq OWNER TO cams;

--
-- Name: tni_site_department_designation_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tni_site_department_designation_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tni_site_department_designation_mapping_id_seq OWNER TO cams;

--
-- Name: tni_sub_catagory_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tni_sub_catagory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tni_sub_catagory_id_seq OWNER TO cams;

--
-- Name: tni_sub_category_emp_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tni_sub_category_emp_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tni_sub_category_emp_mapping_id_seq OWNER TO cams;

--
-- Name: tni_test_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tni_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tni_test_id_seq OWNER TO cams;

--
-- Name: tni_trainer_subcategory_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tni_trainer_subcategory_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tni_trainer_subcategory_mapping_id_seq OWNER TO cams;

--
-- Name: tni_trainig_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE tni_trainig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.tni_trainig_id_seq OWNER TO cams;

--
-- Name: trainer_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE trainer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.trainer_id_seq OWNER TO cams;

--
-- Name: wfcm_adhoc_training_document_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_adhoc_training_document_master (
    wfcm_adhoc_training_document_id integer NOT NULL,
    training_topic_id integer NOT NULL,
    counter integer NOT NULL,
    uploaded_question_doc_id integer,
    uploaded_doc_id integer
);


ALTER TABLE camsdb.wfcm_adhoc_training_document_master OWNER TO cams;

--
-- Name: wfcm_adhoc_training_document__wfcm_adhoc_training_document__seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_adhoc_training_document__wfcm_adhoc_training_document__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_adhoc_training_document__wfcm_adhoc_training_document__seq OWNER TO cams;

--
-- Name: wfcm_adhoc_training_document__wfcm_adhoc_training_document__seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_adhoc_training_document__wfcm_adhoc_training_document__seq OWNED BY wfcm_adhoc_training_document_master.wfcm_adhoc_training_document_id;


--
-- Name: wfcm_adhoc_training_employee_result_details; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_adhoc_training_employee_result_details (
    wfcm_adhoc_training_employee_id integer NOT NULL,
    adhoc_training_id integer NOT NULL,
    emp_id integer NOT NULL,
    result boolean,
    percentage integer NOT NULL
);


ALTER TABLE camsdb.wfcm_adhoc_training_employee_result_details OWNER TO cams;

--
-- Name: wfcm_adhoc_training_employee__wfcm_adhoc_training_employee__seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_adhoc_training_employee__wfcm_adhoc_training_employee__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_adhoc_training_employee__wfcm_adhoc_training_employee__seq OWNER TO cams;

--
-- Name: wfcm_adhoc_training_employee__wfcm_adhoc_training_employee__seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_adhoc_training_employee__wfcm_adhoc_training_employee__seq OWNED BY wfcm_adhoc_training_employee_result_details.wfcm_adhoc_training_employee_id;


--
-- Name: wfcm_adhoc_training_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_adhoc_training_master (
    adhoc_training_id integer NOT NULL,
    training_topic_id integer NOT NULL,
    trainer_idc character varying(100) NOT NULL,
    training_date timestamp without time zone,
    start_time time without time zone,
    end_time time without time zone,
    emp_id integer NOT NULL,
    is_internal boolean,
    doc_id integer,
    site_id integer
);


ALTER TABLE camsdb.wfcm_adhoc_training_master OWNER TO cams;

--
-- Name: wfcm_adhoc_training_master_adhoc_training_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_adhoc_training_master_adhoc_training_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_adhoc_training_master_adhoc_training_id_seq OWNER TO cams;

--
-- Name: wfcm_adhoc_training_master_adhoc_training_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_adhoc_training_master_adhoc_training_id_seq OWNED BY wfcm_adhoc_training_master.adhoc_training_id;


--
-- Name: wfcm_adhoc_training_topic_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_adhoc_training_topic_master (
    training_topic_id integer NOT NULL,
    training_topic text NOT NULL,
    internal boolean,
    has_question boolean,
    site_id integer
);


ALTER TABLE camsdb.wfcm_adhoc_training_topic_master OWNER TO cams;

--
-- Name: wfcm_adhoc_training_topic_master_training_topic_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_adhoc_training_topic_master_training_topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_adhoc_training_topic_master_training_topic_id_seq OWNER TO cams;

--
-- Name: wfcm_adhoc_training_topic_master_training_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_adhoc_training_topic_master_training_topic_id_seq OWNED BY wfcm_adhoc_training_topic_master.training_topic_id;


--
-- Name: wfcm_training_deviation_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_training_deviation_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_training_deviation_seq OWNER TO cams;

--
-- Name: wfcm_deviation_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_deviation_master (
    deviation_id integer DEFAULT nextval('wfcm_training_deviation_seq'::regclass) NOT NULL,
    deviation_number character varying(50) NOT NULL,
    is_closed boolean,
    emp_id integer NOT NULL,
    sop_training_id integer NOT NULL,
    training_start_date timestamp without time zone,
    training_end_date timestamp without time zone,
    deviation_date timestamp without time zone,
    deviation_created_by integer,
    deviation_comment character varying(300),
    is_retrng boolean DEFAULT false
);


ALTER TABLE camsdb.wfcm_deviation_master OWNER TO cams;

--
-- Name: wfcm_emp_sop_training_maping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_emp_sop_training_maping (
    emp_sop_training_maping_id integer DEFAULT nextval('emp_sop_training_maping_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    sop_training_id integer NOT NULL
);


ALTER TABLE camsdb.wfcm_emp_sop_training_maping OWNER TO cams;

--
-- Name: wfcm_emp_tni_trainer_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_emp_tni_trainer_mapping (
    emp_tni_trainer_mapping_id integer DEFAULT nextval('emp_tni_trainer_mapping_id_seq'::regclass) NOT NULL,
    emp_id integer,
    trainer_id integer,
    tni_sub_category_id integer NOT NULL
);


ALTER TABLE camsdb.wfcm_emp_tni_trainer_mapping OWNER TO cams;

--
-- Name: wfcm_emp_training_attendance; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_emp_training_attendance (
    emp_training_attendance_id character varying(5) DEFAULT nextval('emp_training_attendance_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    sop_training_id integer NOT NULL,
    training_date date NOT NULL,
    training_attended boolean NOT NULL
);


ALTER TABLE camsdb.wfcm_emp_training_attendance OWNER TO cams;

--
-- Name: wfcm_employe_jd_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_employe_jd_mapping (
    emp_jd_id integer NOT NULL,
    jobdescription_id integer NOT NULL,
    emp_id integer NOT NULL,
    site_id integer
);


ALTER TABLE camsdb.wfcm_employe_jd_mapping OWNER TO cams;

--
-- Name: wfcm_employe_jd_mapping_emp_jd_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_employe_jd_mapping_emp_jd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_employe_jd_mapping_emp_jd_id_seq OWNER TO cams;

--
-- Name: wfcm_employe_jd_mapping_emp_jd_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_employe_jd_mapping_emp_jd_id_seq OWNED BY wfcm_employe_jd_mapping.emp_jd_id;


--
-- Name: wfcm_employee_jobdescription; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_employee_jobdescription (
    jobdescription_id integer NOT NULL,
    emp_id integer NOT NULL,
    jd_desig_id integer NOT NULL,
    reporting_manager_emp_id integer NOT NULL,
    dept_training_coordinator_emp_id integer NOT NULL,
    updated_date date,
    job_description_status character varying(25) DEFAULT NULL::character varying,
    jd_created_by integer NOT NULL,
    revision_no integer NOT NULL,
    delegation_emp_id integer,
    absent_emp_id integer,
    doc_id integer,
    jd_uploaded boolean DEFAULT false,
    jd_dept_id integer,
    site_id integer,
    jd_approved_by integer
);


ALTER TABLE camsdb.wfcm_employee_jobdescription OWNER TO cams;

--
-- Name: wfcm_employee_jobdescription_jobdescription_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_employee_jobdescription_jobdescription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_employee_jobdescription_jobdescription_id_seq OWNER TO cams;

--
-- Name: wfcm_employee_jobdescription_jobdescription_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_employee_jobdescription_jobdescription_id_seq OWNED BY wfcm_employee_jobdescription.jobdescription_id;


--
-- Name: wfcm_employee_sop_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_employee_sop_mapping (
    employee_sop_mapping_id integer DEFAULT nextval('employee_sop_mapping_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    sop_id integer NOT NULL,
    version integer NOT NULL,
    isfixed boolean
);


ALTER TABLE camsdb.wfcm_employee_sop_mapping OWNER TO cams;

--
-- Name: wfcm_employee_tni_training_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_employee_tni_training_mapping (
    employee_tni_training_mapping_id integer DEFAULT nextval('employee_tni_training_mapping_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    tni_trainig_id integer NOT NULL
);


ALTER TABLE camsdb.wfcm_employee_tni_training_mapping OWNER TO cams;

--
-- Name: wfcm_employee_training_certificate; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_employee_training_certificate (
    employee_training_certificate_id integer DEFAULT nextval('employee_training_certificate_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    issue_date date,
    hod_emp_id integer NOT NULL,
    certificate bytea,
    comment character varying(300),
    date_of_last_jr date
);


ALTER TABLE camsdb.wfcm_employee_training_certificate OWNER TO cams;

--
-- Name: wfcm_function_department_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_function_department_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_function_department_mapping_id_seq OWNER TO cams;

--
-- Name: wfcm_function_department_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_function_department_mapping (
    function_department_mapping_id integer DEFAULT nextval('wfcm_function_department_mapping_id_seq'::regclass) NOT NULL,
    function_id integer NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE camsdb.wfcm_function_department_mapping OWNER TO cams;

--
-- Name: wfcm_function_emp_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_function_emp_mapping (
    function_emp_mapping_id integer NOT NULL,
    function_id integer NOT NULL,
    emp_id integer NOT NULL,
    version integer DEFAULT 1,
    function_justification_id integer,
    site_id integer
);


ALTER TABLE camsdb.wfcm_function_emp_mapping OWNER TO cams;

--
-- Name: wfcm_function_emp_mapping_function_emp_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_function_emp_mapping_function_emp_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_function_emp_mapping_function_emp_mapping_id_seq OWNER TO cams;

--
-- Name: wfcm_function_emp_mapping_function_emp_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_function_emp_mapping_function_emp_mapping_id_seq OWNED BY wfcm_function_emp_mapping.function_emp_mapping_id;


--
-- Name: wfcm_function_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_function_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_function_id_seq OWNER TO cams;

--
-- Name: wfcm_function_justification; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_function_justification (
    function_justification_id integer NOT NULL,
    justification text
);


ALTER TABLE camsdb.wfcm_function_justification OWNER TO cams;

--
-- Name: wfcm_function_justification_function_justification_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_function_justification_function_justification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_function_justification_function_justification_id_seq OWNER TO cams;

--
-- Name: wfcm_function_justification_function_justification_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_function_justification_function_justification_id_seq OWNED BY wfcm_function_justification.function_justification_id;


--
-- Name: wfcm_function_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_function_master (
    function_id integer DEFAULT nextval('wfcm_function_id_seq'::regclass) NOT NULL,
    function_name character varying(200) NOT NULL,
    function_code character varying(100) NOT NULL,
    function_description character varying(500),
    is_active boolean DEFAULT false,
    pending_approval boolean DEFAULT true,
    approval_flag boolean,
    approval_time timestamp without time zone,
    approval_user_id integer,
    approval_comments character varying(500),
    deactivated_by integer,
    deactivated_date timestamp without time zone,
    deactivation_comment character varying(100),
    task_id integer,
    site_id integer
);


ALTER TABLE camsdb.wfcm_function_master OWNER TO cams;

--
-- Name: wfcm_function_sop_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_function_sop_mapping (
    function_sop_mapping_id integer NOT NULL,
    function_id integer NOT NULL,
    sop_id integer NOT NULL,
    is_active boolean,
    deactivated_by integer,
    deactivated_date timestamp without time zone,
    deactivation_comment character varying(100)
);


ALTER TABLE camsdb.wfcm_function_sop_mapping OWNER TO cams;

--
-- Name: wfcm_function_sop_mapping_function_sop_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_function_sop_mapping_function_sop_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_function_sop_mapping_function_sop_mapping_id_seq OWNER TO cams;

--
-- Name: wfcm_function_sop_mapping_function_sop_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_function_sop_mapping_function_sop_mapping_id_seq OWNED BY wfcm_function_sop_mapping.function_sop_mapping_id;


--
-- Name: wfcm_hr_department_trainer_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_hr_department_trainer_mapping (
    hr_department_trainer_mapping_id integer DEFAULT nextval('hr_department_trainer_mapping_id_seq'::regclass) NOT NULL,
    trainer_id integer,
    training_topic character varying(100),
    site_id integer,
    dept_name character varying(250)
);


ALTER TABLE camsdb.wfcm_hr_department_trainer_mapping OWNER TO cams;

--
-- Name: wfcm_hr_dept_training; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_hr_dept_training (
    id integer DEFAULT nextval('_hr_dept_training_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    dept_id integer NOT NULL,
    site_id integer NOT NULL,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    approval_status boolean,
    approved_by integer DEFAULT 0,
    approval_time timestamp without time zone,
    created_date timestamp without time zone,
    doc_id integer,
    task_id integer
);


ALTER TABLE camsdb.wfcm_hr_dept_training OWNER TO cams;

--
-- Name: wfcm_hr_training; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_hr_training (
    hr_training_id integer DEFAULT nextval('_hr_training_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    training_date date,
    training_id integer NOT NULL,
    created_date timestamp without time zone,
    status boolean
);


ALTER TABLE camsdb.wfcm_hr_training OWNER TO cams;

--
-- Name: wfcm_job_responsiblities; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_job_responsiblities (
    respo_id integer NOT NULL,
    jobdescription_id integer NOT NULL,
    responsiblities text
);


ALTER TABLE camsdb.wfcm_job_responsiblities OWNER TO cams;

--
-- Name: wfcm_job_responsiblities_respo_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_job_responsiblities_respo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_job_responsiblities_respo_id_seq OWNER TO cams;

--
-- Name: wfcm_job_responsiblities_respo_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_job_responsiblities_respo_id_seq OWNED BY wfcm_job_responsiblities.respo_id;


--
-- Name: wfcm_live_sop_test; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_live_sop_test (
    live_sop_test_id integer DEFAULT nextval('live_sop_test_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    sop_training_id integer NOT NULL,
    sop_version_id integer NOT NULL,
    test_create_date timestamp without time zone,
    training_start_date timestamp without time zone,
    training_end_date timestamp without time zone,
    is_retrng boolean,
    is_deviated boolean,
    last_score double precision,
    test_data timestamp without time zone,
    attempt integer,
    mail_scheduled integer,
    task_id integer,
    in_progress boolean DEFAULT false
);


ALTER TABLE camsdb.wfcm_live_sop_test OWNER TO cams;

--
-- Name: wfcm_live_tni_test_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_live_tni_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_live_tni_test_id_seq OWNER TO cams;

--
-- Name: wfcm_live_tni_test; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_live_tni_test (
    live_tni_test_id integer DEFAULT nextval('wfcm_live_tni_test_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    tni_trainig_id integer NOT NULL,
    tni_sub_category_id integer NOT NULL,
    tni_id integer,
    test_create_date timestamp without time zone,
    training_start_date timestamp without time zone,
    training_end_date timestamp without time zone,
    is_retrng boolean,
    attempt integer,
    max_score integer,
    is_pass_fail boolean,
    last_score double precision,
    test_data timestamp without time zone
);


ALTER TABLE camsdb.wfcm_live_tni_test OWNER TO cams;

--
-- Name: wfcm_room_training_id; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_room_training_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_room_training_id OWNER TO cams;

--
-- Name: wfcm_room_training; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_room_training (
    wfcm_room_training_id integer DEFAULT nextval('wfcm_room_training_id'::regclass) NOT NULL,
    uploaded_date timestamp with time zone,
    doc_id integer
);


ALTER TABLE camsdb.wfcm_room_training OWNER TO cams;

--
-- Name: wfcm_room_training_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_room_training_mapping (
    wfcm_room_training_mapping_id integer NOT NULL,
    wfcm_room_training_id integer,
    emp_id integer,
    wfcm_sop_test_id integer,
    sop_version_id integer,
    test_date timestamp with time zone,
    start_time time without time zone,
    end_time time without time zone,
    has_question boolean DEFAULT false,
    emp_doc_id integer
);


ALTER TABLE camsdb.wfcm_room_training_mapping OWNER TO cams;

--
-- Name: wfcm_room_training_mapping_wfcm_room_training_mapping_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_room_training_mapping_wfcm_room_training_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_room_training_mapping_wfcm_room_training_mapping_id_seq OWNER TO cams;

--
-- Name: wfcm_room_training_mapping_wfcm_room_training_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_room_training_mapping_wfcm_room_training_mapping_id_seq OWNED BY wfcm_room_training_mapping.wfcm_room_training_mapping_id;


--
-- Name: wfcm_sop_approval; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_approval (
    sop_approval_id integer DEFAULT nextval('sop_approval_id_seq'::regclass) NOT NULL,
    sop_id integer NOT NULL,
    message character varying(300) NOT NULL,
    from_site_dept integer NOT NULL,
    to_site_dept integer NOT NULL,
    request_date timestamp without time zone NOT NULL,
    response_date timestamp without time zone,
    status character varying(15) NOT NULL
);


ALTER TABLE camsdb.wfcm_sop_approval OWNER TO cams;

--
-- Name: wfcm_sop_blocked_test; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_blocked_test (
    sop_blocked_test_id integer DEFAULT nextval('sop_blocked_test_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    sop_training_id integer NOT NULL,
    attmpt integer NOT NULL,
    approval boolean NOT NULL,
    applied boolean,
    comment text,
    task_id integer,
    unblocked_by integer,
    site_id integer
);


ALTER TABLE camsdb.wfcm_sop_blocked_test OWNER TO cams;

--
-- Name: wfcm_sop_category_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_category_mapping (
    sop_category_mapping_id integer DEFAULT nextval('sop_category_mapping_id_seq'::regclass) NOT NULL,
    sop_category_id integer NOT NULL,
    sop_version_id integer NOT NULL
);


ALTER TABLE camsdb.wfcm_sop_category_mapping OWNER TO cams;

--
-- Name: wfcm_sop_category_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_category_master (
    sop_category_id integer DEFAULT nextval('sop_category_id_seq'::regclass) NOT NULL,
    sop_category_name character varying(200) NOT NULL,
    isactive boolean NOT NULL,
    site_id integer
);


ALTER TABLE camsdb.wfcm_sop_category_master OWNER TO cams;

--
-- Name: wfcm_sop_department_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_department_mapping (
    sop_department_mapping_id integer DEFAULT nextval('sop_department_mapping_id_seq'::regclass) NOT NULL,
    dept_id integer NOT NULL,
    sop_version_id integer NOT NULL
);


ALTER TABLE camsdb.wfcm_sop_department_mapping OWNER TO cams;

--
-- Name: wfcm_sop_image_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_image_master (
    sop_image_master_id integer DEFAULT nextval('sop_image_master_id_seq'::regclass) NOT NULL,
    upload_date date NOT NULL,
    sop_uploaded bytea NOT NULL,
    sop_version_id integer NOT NULL
);


ALTER TABLE camsdb.wfcm_sop_image_master OWNER TO cams;

--
-- Name: wfcm_sop_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_master (
    sop_id integer DEFAULT nextval('sop_id_seq'::regclass) NOT NULL,
    description character varying(300),
    ref_doc_no character varying(45) NOT NULL,
    additional_links text,
    is_active boolean DEFAULT true NOT NULL,
    last_revision_number character varying(10) NOT NULL,
    issop boolean DEFAULT false NOT NULL,
    created_date timestamp without time zone,
    counter integer DEFAULT 0,
    deactivated_by integer,
    deactivated_date timestamp with time zone,
    deactivation_comment character varying(100),
    site_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE camsdb.wfcm_sop_master OWNER TO cams;

--
-- Name: wfcm_sop_media; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_media (
    sop_media_id integer DEFAULT nextval('sop_media_id_seq'::regclass) NOT NULL,
    sop_version_id integer,
    filname character varying(200),
    is_active boolean,
    sop_media_data bytea,
    type character varying(100),
    created_date date,
    updated_date date,
    creted_by character varying(200)
);


ALTER TABLE camsdb.wfcm_sop_media OWNER TO cams;

--
-- Name: wfcm_sop_question_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_question_master (
    sop_question_id integer DEFAULT nextval('sop_question_id_seq'::regclass) NOT NULL,
    question_text text NOT NULL,
    is_compuslory boolean,
    sop_version_id integer NOT NULL
);


ALTER TABLE camsdb.wfcm_sop_question_master OWNER TO cams;

--
-- Name: wfcm_sop_question_option_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_question_option_mapping (
    sop_question_option_id integer DEFAULT nextval('sop_question_option_id_seq'::regclass) NOT NULL,
    sop_question_id integer NOT NULL,
    option_text text,
    is_true boolean DEFAULT false
);


ALTER TABLE camsdb.wfcm_sop_question_option_mapping OWNER TO cams;

--
-- Name: wfcm_sop_site_department_group_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_site_department_group_mapping (
    sop_site_department_group_mapping_id integer DEFAULT 'sop_site_department_group_mapping_id_seq'::regclass NOT NULL,
    sop_version_id integer NOT NULL,
    site_id integer NOT NULL,
    dept_id integer,
    is_active boolean DEFAULT true,
    is_harmonized boolean DEFAULT false NOT NULL,
    group_id integer
);


ALTER TABLE camsdb.wfcm_sop_site_department_group_mapping OWNER TO cams;

--
-- Name: wfcm_sop_status_handler; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_status_handler (
    sop_approval_id integer NOT NULL,
    sop_version_id integer NOT NULL,
    approved_by integer NOT NULL,
    approves_date timestamp with time zone,
    comment text,
    approve_status boolean,
    disapprove_status boolean,
    task_id integer
);


ALTER TABLE camsdb.wfcm_sop_status_handler OWNER TO cams;

--
-- Name: wfcm_sop_status_handler_sop_approval_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_sop_status_handler_sop_approval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_sop_status_handler_sop_approval_id_seq OWNER TO cams;

--
-- Name: wfcm_sop_status_handler_sop_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_sop_status_handler_sop_approval_id_seq OWNED BY wfcm_sop_status_handler.sop_approval_id;


--
-- Name: wfcm_sop_test; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_test (
    sop_test_id integer DEFAULT nextval('sop_test_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    sop_training_id integer NOT NULL,
    sop_version_id integer NOT NULL,
    attempt integer NOT NULL,
    score double precision NOT NULL,
    test_date timestamp with time zone NOT NULL,
    is_retrng boolean,
    is_pass_fail boolean,
    max_score integer,
    trainer_id integer
);


ALTER TABLE camsdb.wfcm_sop_test OWNER TO cams;

--
-- Name: wfcm_sop_test_data; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_test_data (
    sop_test_data_id integer NOT NULL,
    sop_question_id integer NOT NULL,
    user_answer text NOT NULL
);


ALTER TABLE camsdb.wfcm_sop_test_data OWNER TO cams;

--
-- Name: wfcm_sop_training_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_training_master (
    sop_training_id integer DEFAULT nextval('sop_training_id_seq'::regclass) NOT NULL,
    sop_version_id integer NOT NULL,
    training_type character varying(20) NOT NULL,
    training_internal_external character varying(10) NOT NULL,
    trainer_info character varying(50),
    training_assesment boolean NOT NULL,
    training_topic character varying(100) NOT NULL,
    training_start_date date,
    training_end_date date,
    start_time time without time zone,
    end_time time without time zone,
    training_create_date timestamp without time zone,
    isgeneric boolean,
    comment character varying(400),
    created_after_effective_date boolean,
    created_by integer,
    pass_score integer,
    mail_scheduled integer
);


ALTER TABLE camsdb.wfcm_sop_training_master OWNER TO cams;

--
-- Name: wfcm_sop_training_master_sop_training_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_sop_training_master_sop_training_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_sop_training_master_sop_training_id_seq OWNER TO cams;

--
-- Name: wfcm_sop_version; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_sop_version (
    sop_version_id integer DEFAULT nextval('sop_version_id_seq'::regclass) NOT NULL,
    revision_no character varying(10) NOT NULL,
    effective_date date NOT NULL,
    next_review_date date NOT NULL,
    valid_till date NOT NULL,
    sop_name character varying(500) NOT NULL,
    has_question boolean NOT NULL,
    has_refreshment_period boolean,
    refreshment_period integer,
    sopReadTime integer;
    change_controll_no character varying(50),
    doc_id integer NOT NULL,
    sop_id integer NOT NULL,
    created_date timestamp without time zone,
    created_by integer,
    job_responsibility text,
    is_image boolean,
    is_active boolean DEFAULT false,
    status character varying(50) NOT NULL,
    sop_status character varying(50) NOT NULL,
    approvedby integer,
    approveddate timestamp without time zone,
    counter integer DEFAULT 0,
    deactivated_by integer,
    deactivated_date timestamp with time zone,
    deactivation_comment character varying(100),
    task_id integer,
    glp_relevant boolean,
    reason_for_change text
);


ALTER TABLE camsdb.wfcm_sop_version OWNER TO cams;

--
-- Name: wfcm_test_doc_mstr; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_test_doc_mstr (
    doc_id integer DEFAULT nextval('test_doc_seq_id'::regclass) NOT NULL,
    doc_uploaded bytea,
    uploaded_date timestamp without time zone,
    wfcm_sop_test_id integer,
    has_question boolean DEFAULT false
);


ALTER TABLE camsdb.wfcm_test_doc_mstr OWNER TO cams;

--
-- Name: wfcm_tni_category_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_category_mapping (
    tni_category_mapping_id integer DEFAULT nextval('tni_category_mapping_id_seq'::regclass) NOT NULL,
    tni_id integer NOT NULL,
    tni_sub_category_id integer NOT NULL,
    version integer NOT NULL
);


ALTER TABLE camsdb.wfcm_tni_category_mapping OWNER TO cams;

--
-- Name: wfcm_tni_category_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_category_master (
    tni_category_id integer DEFAULT nextval('tni_category_id_seq'::regclass) NOT NULL,
    tni_category_name character varying(200) NOT NULL,
    tni_isactive boolean
);


ALTER TABLE camsdb.wfcm_tni_category_master OWNER TO cams;

--
-- Name: wfcm_tni_image_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_image_master (
    tni_image_master_id integer DEFAULT nextval('tni_image_master_id_seq'::regclass) NOT NULL,
    upload_date date NOT NULL,
    tni_uploaded bytea NOT NULL,
    tni_id integer NOT NULL
);


ALTER TABLE camsdb.wfcm_tni_image_master OWNER TO cams;

--
-- Name: wfcm_tni_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_master (
    tni_id integer DEFAULT nextval('tni_id_seq'::regclass) NOT NULL,
    description character varying(500),
    is_read_and_ack boolean NOT NULL,
    effective_date date NOT NULL,
    valid_till date NOT NULL,
    next_review_date date NOT NULL,
    additional_links text,
    is_active boolean NOT NULL,
    doc_id integer NOT NULL,
    is_image_uploaded boolean DEFAULT false,
    version integer DEFAULT 1 NOT NULL,
    sub_category integer,
    is_latest boolean,
    tni_name character varying(100)
);


ALTER TABLE camsdb.wfcm_tni_master OWNER TO cams;

--
-- Name: wfcm_tni_question_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_question_master (
    tni_question_id integer DEFAULT nextval('tni_question_id_seq'::regclass) NOT NULL,
    tni_id integer NOT NULL,
    question_text text NOT NULL,
    is_compuslory boolean
);


ALTER TABLE camsdb.wfcm_tni_question_master OWNER TO cams;

--
-- Name: wfcm_tni_question_option_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_question_option_mapping (
    tni_question_option_id integer DEFAULT nextval('tni_question_option_id_seq'::regclass) NOT NULL,
    tni_question_id integer NOT NULL,
    tni_question_option_text text NOT NULL,
    is_true boolean DEFAULT false
);


ALTER TABLE camsdb.wfcm_tni_question_option_mapping OWNER TO cams;

--
-- Name: wfcm_tni_site_department_designation_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_site_department_designation_mapping (
    tni_site_department_designation_mapping_id integer DEFAULT nextval('tni_site_department_designation_mapping_id_seq'::regclass) NOT NULL,
    tni_id integer NOT NULL,
    site_id integer NOT NULL,
    dept_id integer,
    desig_id integer,
    isactive boolean DEFAULT false NOT NULL
);


ALTER TABLE camsdb.wfcm_tni_site_department_designation_mapping OWNER TO cams;

--
-- Name: wfcm_tni_sub_catagory_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_sub_catagory_master (
    tni_sub_category_id integer DEFAULT nextval('tni_sub_catagory_id_seq'::regclass) NOT NULL,
    tni_sub_category_name character varying(200) NOT NULL,
    tni_category_id integer NOT NULL
);


ALTER TABLE camsdb.wfcm_tni_sub_catagory_master OWNER TO cams;

--
-- Name: wfcm_tni_sub_category_emp_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_sub_category_emp_mapping (
    tni_sub_category_emp_mapping_id integer DEFAULT nextval('tni_sub_category_emp_mapping_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    tni_sub_category_id integer,
    assignment_no integer NOT NULL
);


ALTER TABLE camsdb.wfcm_tni_sub_category_emp_mapping OWNER TO cams;

--
-- Name: wfcm_tni_test; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_test (
    tni_test_id integer DEFAULT nextval('tni_test_id_seq'::regclass) NOT NULL,
    emp_id integer NOT NULL,
    tni_training_id integer NOT NULL,
    attempt integer NOT NULL,
    score double precision NOT NULL,
    test_date timestamp without time zone NOT NULL,
    max_score integer,
    is_pass_fail boolean
);


ALTER TABLE camsdb.wfcm_tni_test OWNER TO cams;

--
-- Name: wfcm_tni_test_data; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_test_data (
    tni_test_id integer NOT NULL,
    tni_question_id integer NOT NULL,
    user_answer text NOT NULL
);


ALTER TABLE camsdb.wfcm_tni_test_data OWNER TO cams;

--
-- Name: wfcm_tni_trainer_subcategory_mapping; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_trainer_subcategory_mapping (
    tni_trainer_subcategory_mapping_id integer DEFAULT nextval('tni_trainer_subcategory_mapping_id_seq'::regclass) NOT NULL,
    tni_sub_catagory_id integer NOT NULL,
    emp_tni_trainer_mapping_id integer NOT NULL
);


ALTER TABLE camsdb.wfcm_tni_trainer_subcategory_mapping OWNER TO cams;

--
-- Name: wfcm_tni_training_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_tni_training_master (
    tni_trainig_id integer DEFAULT nextval('tni_trainig_id_seq'::regclass) NOT NULL,
    tni_id integer NOT NULL,
    training_type character varying(20) NOT NULL,
    training_internal_external character varying(10) NOT NULL,
    trainer_info character varying(50),
    training_assesment boolean NOT NULL,
    training_topic character varying(100) NOT NULL,
    training_start_dt date,
    training_end_dt date,
    start_time time without time zone,
    end_time time without time zone,
    training_create_dt date,
    isgeneric boolean,
    comment character varying(400),
    created_after_eff_date boolean,
    max_score integer
);


ALTER TABLE camsdb.wfcm_tni_training_master OWNER TO cams;

--
-- Name: wfcm_trainer_certificate; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_trainer_certificate (
    wfcm_trainer_certificate_id integer NOT NULL,
    emp_id integer,
    certificate_doc_id integer
);


ALTER TABLE camsdb.wfcm_trainer_certificate OWNER TO cams;

--
-- Name: wfcm_trainer_certificate_wfcm_trainer_certificate_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_trainer_certificate_wfcm_trainer_certificate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_trainer_certificate_wfcm_trainer_certificate_id_seq OWNER TO cams;

--
-- Name: wfcm_trainer_certificate_wfcm_trainer_certificate_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_trainer_certificate_wfcm_trainer_certificate_id_seq OWNED BY wfcm_trainer_certificate.wfcm_trainer_certificate_id;


--
-- Name: wfcm_trainer_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_trainer_master (
    trainer_id integer DEFAULT nextval('trainer_id_seq'::regclass) NOT NULL,
    trainer_idc character varying(25) NOT NULL,
    salutation character varying(5) NOT NULL,
    trainer_name character varying(30) NOT NULL,
    trainer_middle_name character varying(30),
    trainer_surname character varying(50) NOT NULL,
    trainer_phone character varying(50) NOT NULL,
    trainer_email_id character varying(60) NOT NULL,
    organization character varying(100) NOT NULL,
    trainer_designation character varying(50) NOT NULL,
    trainer_experiance numeric(3,2) NOT NULL,
    created_date timestamp without time zone,
    is_active boolean
);


ALTER TABLE camsdb.wfcm_trainer_master OWNER TO cams;

--
-- Name: wfcm_upload_induction_master; Type: TABLE; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE TABLE wfcm_upload_induction_master (
    uploaded_induction_id integer NOT NULL,
    test_date date,
    doc_id integer,
    site_id integer
);


ALTER TABLE camsdb.wfcm_upload_induction_master OWNER TO cams;

--
-- Name: wfcm_upload_induction_master_uploaded_induction_id_seq; Type: SEQUENCE; Schema: camsdb; Owner: cams
--

CREATE SEQUENCE wfcm_upload_induction_master_uploaded_induction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camsdb.wfcm_upload_induction_master_uploaded_induction_id_seq OWNER TO cams;

--
-- Name: wfcm_upload_induction_master_uploaded_induction_id_seq; Type: SEQUENCE OWNED BY; Schema: camsdb; Owner: cams
--

ALTER SEQUENCE wfcm_upload_induction_master_uploaded_induction_id_seq OWNED BY wfcm_upload_induction_master.uploaded_induction_id;


--
-- Name: id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_adhoc_role_permission_mapping ALTER COLUMN id SET DEFAULT nextval('cams_adhoc_role_permission_mapping_id_seq'::regclass);


--
-- Name: admin_config_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_admin_config ALTER COLUMN admin_config_id SET DEFAULT nextval('cams_admin_config_admin_config_id_seq'::regclass);


--
-- Name: emp_hire_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_employe_hire_mapping ALTER COLUMN emp_hire_id SET DEFAULT nextval('cams_employe_hire_mapping_emp_hire_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_login_master ALTER COLUMN id SET DEFAULT nextval('cams_login_master_id_seq'::regclass);


--
-- Name: cams_module_tab_adhocrole_mapping_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_tab_adhocrole_mapping ALTER COLUMN cams_module_tab_adhocrole_mapping_id SET DEFAULT nextval('cams_module_tab_adhocrole_map_cams_module_tab_adhocrole_map_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_permission_master ALTER COLUMN id SET DEFAULT nextval('cams_permission_master_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_translation ALTER COLUMN id SET DEFAULT nextval('cams_translation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_user_task ALTER COLUMN id SET DEFAULT nextval('cams_user_task_id_seq'::regclass);


--
-- Name: assign_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_user_task_assignes ALTER COLUMN assign_id SET DEFAULT nextval('cams_user_task_assignes_assign_id_seq'::regclass);


--
-- Name: wfcm_adhoc_training_document_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_adhoc_training_document_master ALTER COLUMN wfcm_adhoc_training_document_id SET DEFAULT nextval('wfcm_adhoc_training_document__wfcm_adhoc_training_document__seq'::regclass);


--
-- Name: wfcm_adhoc_training_employee_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_adhoc_training_employee_result_details ALTER COLUMN wfcm_adhoc_training_employee_id SET DEFAULT nextval('wfcm_adhoc_training_employee__wfcm_adhoc_training_employee__seq'::regclass);


--
-- Name: adhoc_training_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_adhoc_training_master ALTER COLUMN adhoc_training_id SET DEFAULT nextval('wfcm_adhoc_training_master_adhoc_training_id_seq'::regclass);


--
-- Name: training_topic_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_adhoc_training_topic_master ALTER COLUMN training_topic_id SET DEFAULT nextval('wfcm_adhoc_training_topic_master_training_topic_id_seq'::regclass);


--
-- Name: emp_jd_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_employe_jd_mapping ALTER COLUMN emp_jd_id SET DEFAULT nextval('wfcm_employe_jd_mapping_emp_jd_id_seq'::regclass);


--
-- Name: jobdescription_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_employee_jobdescription ALTER COLUMN jobdescription_id SET DEFAULT nextval('wfcm_employee_jobdescription_jobdescription_id_seq'::regclass);


--
-- Name: function_emp_mapping_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_function_emp_mapping ALTER COLUMN function_emp_mapping_id SET DEFAULT nextval('wfcm_function_emp_mapping_function_emp_mapping_id_seq'::regclass);


--
-- Name: function_justification_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_function_justification ALTER COLUMN function_justification_id SET DEFAULT nextval('wfcm_function_justification_function_justification_id_seq'::regclass);


--
-- Name: function_sop_mapping_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_function_sop_mapping ALTER COLUMN function_sop_mapping_id SET DEFAULT nextval('wfcm_function_sop_mapping_function_sop_mapping_id_seq'::regclass);


--
-- Name: respo_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_job_responsiblities ALTER COLUMN respo_id SET DEFAULT nextval('wfcm_job_responsiblities_respo_id_seq'::regclass);


--
-- Name: wfcm_room_training_mapping_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_room_training_mapping ALTER COLUMN wfcm_room_training_mapping_id SET DEFAULT nextval('wfcm_room_training_mapping_wfcm_room_training_mapping_id_seq'::regclass);


--
-- Name: sop_approval_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_status_handler ALTER COLUMN sop_approval_id SET DEFAULT nextval('wfcm_sop_status_handler_sop_approval_id_seq'::regclass);


--
-- Name: wfcm_trainer_certificate_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_trainer_certificate ALTER COLUMN wfcm_trainer_certificate_id SET DEFAULT nextval('wfcm_trainer_certificate_wfcm_trainer_certificate_id_seq'::regclass);


--
-- Name: uploaded_induction_id; Type: DEFAULT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_upload_induction_master ALTER COLUMN uploaded_induction_id SET DEFAULT nextval('wfcm_upload_induction_master_uploaded_induction_id_seq'::regclass);


--
-- Name: _hr_dept_training_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('_hr_dept_training_id_seq', 1, false);


--
-- Name: _hr_training_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('_hr_training_id_seq', 15, true);


--
-- Name: _pending_mail_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('_pending_mail_id_seq', 1, false);


--
-- Name: adhoc_role_applicant_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('adhoc_role_applicant_id_seq', 37, true);


--
-- Name: adhoc_role_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('adhoc_role_id_seq', 7, true);


--
-- Name: admin_config_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('admin_config_id_seq', 49, true);


--
-- Name: audit_log_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('audit_log_id_seq', 469, true);


--
-- Data for Name: cams_adhoc_role_applicants_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_adhoc_role_applicants_mapping (adhoc_role_applicant_id, adhoc_role_id, emp_id, site_id) FROM stdin;
15	2	4	1
16	4	4	1
\.


--
-- Data for Name: cams_adhoc_role_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_adhoc_role_master (adhoc_role_id, adhoc_role_name) FROM stdin;
1	WFCM_LOCATION_TRAINING_COORDINATOR
2	WFCM_SUPER_ADMIN
3	WFCM_DEPARTMENT_HEAD
4	WFCM_EMPLOYEE
5	WFCM_DEPARTMENT_TRAINING_COORDINATOR
6	WFCM_HUMAN_RESOURCE
7	WFCM_FUNCTIONAL_HEAD
\.


--
-- Data for Name: cams_adhoc_role_permission_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_adhoc_role_permission_mapping (id, adhoc_role_id, permission_id) FROM stdin;
1	4	1
2	4	2
3	4	3
\.


--
-- Name: cams_adhoc_role_permission_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_adhoc_role_permission_mapping_id_seq', 3, true);


--
-- Data for Name: cams_admin_config; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_admin_config (admin_config_id, site_id, module_id, config_key, config_value, config_group, control_type, regex, is_active) FROM stdin;
131	1	\N	comparison_command	/bin/sh	COMPARISON	textbox	.*?	t
132	1	2	cams_email_id	no-reply@discusit.com	ADMIN	textbox	^[A-Za-z0-9_\\-\\.]+@[A-Za-z0-9_\\-\\.]{2,}\\.[A-Za-z0-9]{2,}(\\.[A-Za-z0-9])?$	t
133	1	1	wfcm_adhoc_trng_mgr_in_emp_screen	No	WFCM	radio	Yes||No	t
134	1	1	scheduler_password_reset_days	45	SCHEDULER	textbox	(([0-9]+)?)+	t
135	1	\N	task_high_priority_days	2	TASK	textbox	(([0-9]+)?)+	t
136	1	\N	task_normal_priority_days	5	TASK	textbox	(([0-9]+)?)+	t
137	1	\N	task_low_priority_days	7	TASK	textbox	(([0-9]+)?)+	t
138	1	\N	task_auto_close_days	4	TASK	textbox	(([0-9]+)?)+	t
139	1	1	sop_valid_till_date_(in_months)	36	SOP	textbox	(([0-9]+)?)+	t
140	1	1	sop_reamind_month	1	SOP	textbox	(([0-9]+)?)+	t
144	1	1	sop_max_attempts	3	SOP	textbox	(([0-9]+)?)+	t
145	1	2	cams_email_password	DiscusIT8232812	ADMIN	password	^(?=.{6,})(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^&+=-]).*$	t
146	1	2	cams_email_hostname	smtp.gmail.com	ADMIN	textbox	^(([a-zA-Z]|[a-zA-Z][a-zA-Z0-9\\-]*[a-zA-Z0-9])\\.)*([A-Za-z]|[A-Za-z][A-Za-z0-9\\-]*[A-Za-z0-9])$	t
147	1	\N	task_critical_priority_days	1	TASK	textbox	(([0-9]+)?)+	t
148	1	1	sop_is_trainer_cert_required	Yes	SOP	radio	Yes||No	t
149	1	1	sop_min_passing_percentage	70	SOP	textbox	^(([1-9][0-9]?)(\\\\.[0-9]+)?)|100$	t
150	1	\N	comparison_option	-c	COMPARISON	textbox	.*?	t
151	1	\N	comparison_path_separator	/	COMPARISON	textbox	.*?	t
152	1	\N	arms_file_sys	/home/discusit/arms_file_sys/	ARMS	textbox	.*?	t
153	1	1	sop_send_mail_to_before_sop_expired_email	no-reply@discusit.com	SOP	textbox	^[A-Za-z0-9_\\-\\.]+@[A-Za-z0-9_\\-\\.]{2,}\\.[A-Za-z0-9]{2,}(\\.[A-Za-z0-9])?$	t
154	1	2	cams_email_port	587	ADMIN	textbox	(([0-9]+)?)+	t
155	1	1	wfcm_induction_pending_intimation_days	4	WFCM	textbox	(([0-9]+)?)+	t
156	1	1	wfcm_induction_pending_blocked_days	6	WFCM	textbox	(([0-9]+)?)+	t
157	1	1	sop_set_trainer_expiration_interval_(in_years)	3	SOP_TRAINING	textbox	(([0-9]+)?)+	t
158	1	2	cams_password_validity_in_days	45	ADMIN	textbox	(([0-9]+)?)+	t
159	1	1	wfcm_adhoc_rpt_mgr_in_emp_screen	No	WFCM	radio	Yes||No	t
160	1	1	sop_training_certificate	SOP Name	SOP_TRAINING	radio	SOP Name||Function	t
162	1	2	cams_port	8080	ADMIN	textbox	^(6553[0-5]|655[0-2]\\d|65[0-4]\\d\\d|6[0-4]\\d{3}|[1-5]\\d{4}|[1-9]\\d{0,3}|0)$	t
163	1	2	cams_ip	192.168.1.107	ADMIN	textbox	^\\b(?:\\d{1,3}\\.){3}\\d{1,3}\\b$	t
164	1	1	wfcm_pending_induction_other_email_ids		WFCM	textbox	^[A-Za-z0-9_\\-\\.]+@[A-Za-z0-9_\\-\\.]{2,}\\.[A-Za-z0-9]{2,}(\\.[A-Za-z0-9])?$	t
165	1	\N	comparison_temp_dir	/tmp/	COMPARISON	textbox	.*?	t
166	1	1	sop_valid_till_date		SOP	textbox	(([0-9]+)?)+	f
167	1	1	sop_training_regeneration_years	1	SOP_TRAINING	textbox	(([0-9]+)?)+	f
168	1	1	sop_training_allowance_period	20	SOP_TRAINING	textbox	(([0-9]+)?)+	f
169	1	1	sop_training_regeneration_start_date_interval	-7	SOP_TRAINING	textbox	(([0-9]+)?)+	f
170	1	1	scheduler_weekly_day	1	SCHEDULER	textbox	(([0-6]))	t
171	1	1	sop_send_approval_to	1	SOP	combobox	departments	t
172	1	1	wfcm_hr_dept_id	10	WFCM	combobox	departments	t
173	1	1	scheduler_mail_scheduled_day_before_effective_date	12	SCHEDULER	textbox	(([0-9]+)?)+	t
161	1	1	wfcm_induction_training_type	Common Induction Training Process	WFCM	radio	Common Induction Training Process||Induction Training Process By Department	t
174	1	1	sop_all_questions_options_display	Yes	SOP	radio	Yes||No	t
176	1	1	sop_department_code_display_utility	No	SOP	radio	Yes||No	t
180	1	2	company_logo_path_url	http://localhost:9090/wfcm-web/images/discusitLogo.png	ADMIN	textbox	.*?	f
181	1	2	cams_company_name	DiscusIT Pvt ltd	ADMIN	textbox	.*?	f
182	1	2	cams_dtc_report_path	/home/anurag/jboss-as-7.1.1.Final/standalone/tmp/DTC_Report/	ADMIN	textbox	.*?	f
183	1	2	cams_company_sign	DiscusIT	ADMIN	textbox	.*?	f
142	1	1	sop_no_of_options	2	SOP	textbox	(([0-9]+)?)+	t
141	1	1	sop_no_of_questions	2	SOP	textbox	(([0-9]+)?)+	t
143	1	1	sop_no_of_question_display	1	SOP	textbox	(([0-9]+)?)+	t
178	1	1	sop_reason_for_change	Yes	SOP	radio	Yes||No	t
\.


--
-- Name: cams_admin_config_admin_config_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_admin_config_admin_config_id_seq', 238, true);


--
-- Data for Name: cams_audit_log_entity; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_audit_log_entity (audit_log_id, audit_action, audit_details, audit_entity, audit_date, audit_by, sub_id, pk_id, site_id) FROM stdin;
\.


--
-- Name: cams_audit_log_entity_audit_log_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_audit_log_entity_audit_log_id_seq', 1, false);


--
-- Data for Name: cams_client_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_client_master (client_id, client_name, activation_date, licensing_firm, license_number, client_activation, activated_by, activation_time) FROM stdin;
1	DiscusIT	2013-12-03	discusit	0001	t	Naman	11:07:33
\.


--
-- Data for Name: cams_client_module_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_client_module_mapping (module_client_mapping_id, module_id, client_id, mapped_date) FROM stdin;
1	1	1	2013-12-03
2	2	1	2013-12-03
\.


--
-- Data for Name: cams_department_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_department_master (dept_id, dept_name, isactive, parent_id, deactivated_by, deactivation_comment) FROM stdin;
1	QA	t	\N	\N	\N
\.


--
-- Data for Name: cams_designation_group_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_designation_group_mapping (designation_group_maping_id, group_id, desig_id, isactive, deactivated_by, deactivation_comment) FROM stdin;
2	1	1	t	\N	\N
\.


--
-- Data for Name: cams_designation_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_designation_master (desig_id, desg_name, isactive, deactivated_by, deactivation_comment, site_id) FROM stdin;
1	Admin	t	\N	\N	1
\.


--
-- Data for Name: cams_document_mstr; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_document_mstr (doc_id, upload_date, uploaded_doc, uploaded_by) FROM stdin;
\.


--
-- Data for Name: cams_email_queue; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_email_queue (id, jbpm_task_id, cams_task_id, status, module_name, description, mail_type, user_name, group_name, recipients, subject) FROM stdin;
\.


--
-- Name: cams_email_queue_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_email_queue_id_seq', 1, false);


--
-- Data for Name: cams_employe_hire_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_employe_hire_mapping (emp_hire_id, tracking_id, emp_id, site_id) FROM stdin;
\.


--
-- Name: cams_employe_hire_mapping_emp_hire_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_employe_hire_mapping_emp_hire_id_seq', 18, true);


--
-- Data for Name: cams_employee_hire_status; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_employee_hire_status (tracking_id, emp_id, emp_recruitment_status, version_no, emp_jd_created_date, emp_hod_jdacceptence_date, emp_jd_acceptence_date, task_id, site_id) FROM stdin;
\.


--
-- Data for Name: cams_employee_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_employee_mapping (emp_maping_id, emp_id, desig_id, dept_id, site_id, is_allocated_induction, reporting_mgr, deactivated_date, deactivation_comment, deactivated_by, is_active, is_trainer) FROM stdin;
3	4	1	1	1	t	4	\N	\N	\N	t	f
\.


--
-- Data for Name: cams_employee_mstr; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_employee_mstr (emp_id, emp_id_company, emp_name, emp_surname, phonenumber, email_id, date_of_joining, isactive, password, activation_date, deactivation_date, resigned, isreplacing, replaced_to, salutation, emp_middlle_name, qualification, exp_years, password_status, isnew, pwd_change_date, is_allocated_induction, employe_creation_date, pass1, pass2, pass3, is_blocked, block_time, login_counter, training_manager, reporting_manager, deactivated_by, deactivation_comment, is_trainer, doc_id, pwdresetdate, prefered_lang) FROM stdin;
4	10001	Admin	admin	123456	no-reply@discusit.com	2013-09-30	t	T6p0mlpSPszvSoA5ebuPWpubmWN5L09Rz8HNkqoGB15tlLR7LGsYd4onVZiL33ka	2013-10-26	\N	\N	f	\N	Mr.	M	be	5	f	f	\N	t	2013-10-26	0hWYeMfFQQNW7mQvizB3UZeghAWcjZsjpukPZd2KH1g2z5D00p9Pj6IAyrYVM/UB	0hWYeMfFQQNW7mQvizB3UZeghAWcjZsjpukPZd2KH1g2z5D00p9Pj6IAyrYVM/UB	0hWYeMfFQQNW7mQvizB3UZeghAWcjZsjpukPZd2KH1g2z5D00p9Pj6IAyrYVM/UB	f	2014-02-13 15:25:07.447	0	\N	\N	\N	\N	f	\N	2015-06-03	\N
\.


--
-- Data for Name: cams_employee_picture_mstr; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_employee_picture_mstr (emp_pic_id, emp_id, picture) FROM stdin;
\.


--
-- Data for Name: cams_employee_role_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_employee_role_mapping (role_id, emp_id, site_id, dept_id, desig_id) FROM stdin;
\.


--
-- Data for Name: cams_employee_trainer_certification; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_employee_trainer_certification (emp_trnr_certifcation_id, ref_id, certification_title, is_emp) FROM stdin;
1	3		t
2	5		t
3	6		t
6	7	SCJP	t
7	8		t
8	9		t
11	11		t
17	17		t
18	18		t
\.


--
-- Data for Name: cams_group_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_group_master (group_id, group_name, group_status) FROM stdin;
3	Below_Officer	t
1	GM & Above	t
2	Officer & Above	t
\.


--
-- Name: cams_hire_tracking_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_hire_tracking_id_seq', 19, true);


--
-- Data for Name: cams_label_resources; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_label_resources (resource_key, resource_value, lang) FROM stdin;
add_certification	Add Certification	en
mapping	Mapping	en
site	Site	en
department	Department	en
group	Group	en
harmonic	Harmonic	en
jr_based_on	JR based on	en
questions	Questions	en
add_question	Add Question	en
save_questions	Save Question	en
questions_added_0	Questions Added: 0	en
add	Add	en
remove	Remove	en
select_employee_by	Select Employee by	en
name	Name	en
id	ID	en
jr	JR	en
designation	Designation	en
search	Search	en
map	Map	en
approvals	Approvals	en
s.no.	S.No.	en
description	Description	en
approval_sent_for	Approval Sent for	en
sent_on	Sent on	en
response_date	Response Date	en
status	Status	en
action	Action	en
employee_id	Employee ID	en
employee_name	Employee Name	en
previous_roles	Previous Roles	en
training	Training	en
date	Date	en
start_time	Start Time	en
total_questions	Total Questions	en
your_scorecard	Your Scorecard	en
correct_answers	Correct Answers	en
wrong_answers	Wrong Answers	en
retest	Retest	en
assign_tni	Assign TNI	en
assign	Assign	en
employee	Employee	en
select_tnis	Select TNIs	en
available_tnis	Available TNIs	en
selected_tnis	Selected TNIs	en
save	Save	en
today	Today	en
previous	Previous	en
next	Next	en
week	Week	en
month	Month	en
category_details	Category Details	en
category_name	Category Name	en
change_password	Change Password	en
new_password	New Password	en
conform_password	Confirm Password	en
submit	Submit	en
cancel	Cancel	en
employee_jrs	Employee JRs	en
ref_doc_no	Ref.Doc.No.	en
ref_doc	Ref.Doc.	en
sop_name	SOP Name	en
training_attended	Training Attended	en
category	Category	en
sub_category	Sub Category	en
read_acknowledge	Read-Acknowledge	en
test_date	Test Date	en
attempt	Attempt	en
trainers	Trainers	en
organization	Organization	en
phone	Phone	en
sop	SOP	en
upcoming_trainings	Upcoming Trainings	en
training_topic	Training Topic	en
start_date	Start Date	en
view_tni	View TNI	en
mapped_at	Mapped At	en
subcategory	SubCategory	en
dashboard	Dashboard	en
mapped_sites	Mapped Sites	en
department_head	Department Head	en
create	Create	en
view	View	en
mapped_group	Mapped Group	en
edit	Edit	en
name_of_designation	Name of Designation	en
active	Active	en
inactive	Inactive	en
mapped_departments	Mapped Departments	en
reset	Reset	en
compulsory	Compulsory	en
general	General	en
new_questions	New Questions	en
edit_question	Edit Question	en
save_as_pdf	Save as PDF	en
harmonise	Harmonise	en
functional	Functional	en
role	Role	en
assigned_roles	Assigned Roles	en
select_all	Select All	en
mails_sent	Mails sent 	en
last_mail_sent	Last mail sent	en
send_email	Send email	en
salutation	Salutation	en
mr	Mr.	en
miss	Miss	en
mrs	Mrs.	en
dr	Dr.	en
select	Select	en
dept	Dept	en
head	Head	en
roles	Roles	en
contact_no	Contact No.	en
qualification	Qualification	en
experience_years	Experience (Years)	en
date_of_joining	Date of Joining	en
email	Email	en
experience	Experience	en
employee_resignation	Employee Resignation	en
employee_detail	Employee Detail	en
employee_experience	Employee Experience	en
Resign	resign	en
employee_transfer	Employee Transfer	en
add_new_roles	Add New Roles	en
transfer	Transfer	en
assign_activities	Assign Activities	en
select_activities	Select Activities	en
available_activities	Available Activities	en
selected_activities	Selected Activities	en
hr	HR	en
site_name	Site Name	en
select_training	Select Training	en
name_of_trainer	Name Of Trainer	en
topic_covered	Topic Covered	en
for_department	For Department	en
dashboards	Dashboards	en
middleame	Middle Name	en
lastName	Last Name	en
new	New	en
replace	Replace	en
certifications	Certifications	en
signin	Sign In	en
username	Username	en
ok	OK	en
admin	Admin	en
hod	HOD	en
reports	Reports	en
welcome	Welcome	en
logout	Logout	en
document_upload	Document Upload	en
type_of_document	Type of Document	en
presentation	Presentation	en
next_review_date	Next Review Date	en
additional_links	Additional Links	en
add_mappings	Add Mappings	en
remove_mappings	Remove Mappings	en
upload_sop	Upload SOP	en
add_questions	Add Questions	en
uploaded_questions	Uploaded Questions:	en
uploaded_sop	Uploaded SOP	en
revision_no	Revision No.	en
eff_date	Eff. Date	en
change_control_no	Change Control No.	en
view_uploaded_file	View uploaded file.	en
edit_questions	Edit Questions	en
update 	Update	en
my_tnis	My TNIs	en
cleared_trainings	Cleared Trainings	en
my_jrs	My JRs	en
reload	Reload	en
pending_trainings	Pending Trainings	en
new_employees	New Employeese	en
emp_code	Emp. Code	en
department_and_site	Department and Site	en
notice	Notice	en
time	Time	en
title	Title	en
send 	Send	en
notice_board	Notice Board	en
permissions	Permissions	en
select_role	Select Role	en
test	Test	en
test_details	Test Details	en
select_test	Select Test	en
read_and_acknowledge	Read and Acknowledge	en
number_of_questions	Number of questions	en
incorrect_answers	Incorrect Answers	en
training_description	Training Description	en
start_test	Start Test	en
presentation_test	Presentation Test	en
select_presentation	Select Presentation	en
number_of_employees	Number Of Employees	en
employees	Employees	en
available_trainings	Available Trainings	en
end_date	End Date	en
browse_file	Browse File	en
uploaded_sops	Uploaded SOPs	en
uploaded_file	Uploaded File	en
select_employee	Select Employee	en
site_	SITE	en
dept_	DEPT	en
desg_	DESG	en
important	Important	en
choose_file	Choose File:	en
select_category	Select Category	en
select_sub_category	Select Sub Category	en
trainings	Trainings	en
tni_category	TNI Category	en
is_active	Is Active	en
tni_subcategory	TNI SubCategory	en
trainer_type 	Trainer Type	en
internal	Internal	en
external	External	en
middle_name	Middle Name	en
surname	Surname	en
phone_no	Phone No.	en
e_mail_id	E-mail Id.	en
trainer	Trainer	en
attendance	Attendance	en
training_details	Training Details	en
training_date	Training Date	en
present	Present	en
upload_directly	Upload Directly	en
cat1	CAT1	en
cat2	CAT2	en
internal_external	Internal/External	en
trainer_information	Trainer Information	en
training_start_date	Training Start Date	en
training_end_date	Training End Date	en
end_time	End Time	en
training_information	Training Information	en
create_training_for	Create training for	en
specific_individuals	Specific individuals	en
mapped_employees	Mapped Employees	en
assign_training	Assign Training	en
view_sop_document	View SOP Document	en
select_sop	Select SOP	en
view_sop	View SOP	en
reference_doc_no	Reference Doc. No.	en
harmonized	Harmonized	en
tni_training_status	TNI Training Status	en
sop_training_status	SOP Trainingszustand	en
S_O_P	S.O.P	en
forgot_password	Forgot Password	en
trainer_info	Trainer Info	en
training_dates	Training Dates	en
training_time	Training Time	en
tni	TNI	en
not_defined	Not defined	en
no_certifications	No Certifications	en
enter_group	Enter Group.	en
enter_department	Enter Department.	en
error_occured	Error occured!	en
error	Error.	en
no_tests_found	No tests found!	en
no_record_found	No record found.	en
error_while_updating	Error while updating!	en
record_already_added	Record already added!	en
no_departments_found	No Departments Found..	en
no_trainings_found	No Departments Found..	en
unknown_error	Unknown Error!!!	en
please_select_a_role	Please select a Role.	en
sop_not_found	Sop not found!	en
document_not_found	Document not found!	en
no_category_exist	No category exist.	en
please_select_a_file	Please Select a File.: 	en
no_trainer_found	No Trainer found..	en
no_tnis_found	No TNIs found.	en
activity_included	Activity included.	en
removed	Removed	en
password	Password	en
close	Close	en
hr_training_created	HR Training Created.	en
message_saved	Message saved	en
no_available_jr	No Available JR!	en
no_employees_found	No Employees found!	en
no_record_available	No Record Available.	en
please_select_an_sop	Please select an SOP.	en
trainings_not_found	Trainings not Found!	en
please_select_a_site	Please select a Site.	en
sites_not_found	Sites not found.	en
employees_not_found	Employees not found.	en
please_select_SOP	Please select SOP.	en
duplicate_values	Duplicate values!	en
please_select_site	Please Select Site.	en
please_select_group	Please Select Group.	en
dept_does_not_exist	Department does not exist.	en
enter_employee_id	Enter employee ID.	en
enter_designation	Enter Designation.	en
enter_employee_name	Enter employee name.	en
enter_contact_number	Enter contact number.	en
enter_email_address	Enter email address.	en
please_enter_title	Please enter Title.	en
enter_site_name	Enter site name.	en
enter_site_address	Enter site address.	en
enter_city	Enter city.	en
enter_state	Enter state.	en
enter_country	Enter country.	en
enter_pincode	Enter pincode.	en
enter_phone_number	Enter phone number.	en
enter_fax_number	Enter fax number.	en
select_a_valid_site	Select a valid site!	en
please_provide_id	Please provide ID.	en
please_provide_email	Please provide email.	en
no_trainer_available	No Trainer Available!	en
please_select_a_date	Please Select a date.	en
hr_departments	Departments	en
bblocked_tests	Blocked Tests	en
item_data	Data	en
item_report	Report	en
site_maintanance	Site Maintainance	en
company.name	Company Name	en
emp_mapping	Employee Mapping	en
deployment	Deployment	en
maintenance_panel	Maintenance Panel	en
emp_panel	Employee Panel	en
address	Address	en
city	City	en
state	State	en
site.create	Create Site	en
site.view	View Site	en
site.update	Update Site	en
site.location	Site Location	en
site.name	Site Name	en
site.search	Search	en
mapped.sites	Mapped Sites	en
dept.text	Department	en
dept.name	Department Name	en
dept.view	View Department	en
dept.search	Department	en
dept.update	Update Department	en
dept.mapng	Mapped Departments	en
desig.text	Designation	en
desig.name	Name of Designation	en
desig.view	View Designation	en
desig.create	Create Designation	en
desig.edit	Edit Designation	en
desig.search	Search Designation	en
tab.view	View	en
tab.create	Create	en
tab.edit	Edit	en
msg.error	Error!	en
msg.error_try_again	Error! Try again.	en
msg.saved	Saved.	en
msg.duplicate_entry	Duplicate entry.	en
msg.no_match_found	No match found.	en
status.inactive	Inactive	en
status.active	Active	en
command.remove	Remove	en
command.add.remove	Add/Remove	en
command.add	Add	en
command.reset	Reset	en
command.save	Save	en
emp.detail	Employee Detail	en
emp.dob	Date of Birth	en
emp.doj	Date of Joining	en
emp.mail	e-mail	en
emp.surname	Surname	en
emp.id	ID	en
emp.search	Search Employee	en
emp.edit	Edit Employee	en
emp.create	Create Employee	en
emp.name	Employee Name	en
command.update	Update	en
error.msg.fax_number	Please enter 10 digit valid Fax Number!	en
training.name	Training Name	en
training.search	Search	en
desig.roles	Roles	en
training.edit	Edit Training	en
training.date.valid	Valid Till	en
training.text	Training	en
training.assessment	Assessment	en
training.create	Create Training	en
training.view	View Training	en
training.type	Type of Training	en
training.sel.all	All	en
category.create	Create Category	en
category.name	Category Name	en
remove_question	Remove Question	en
questions_added	Questions Added:	en
question	Question	en
no_jr_is_selected	No JR is Selected!	en
approve	Approve	en
disapprove	Disapprove	en
_fail	% Fail	en
_pass	% Pass	en
unblock	Unblock	en
in_Active	In-Active	en
no_category_exists	No Category Exists	en
password_is_wrong	Password is wrong!	en
yes	Yes	en
no	No	en
n_a	N/A	en
n.a	N.A	en
site_pdf	Site :	en
department_pdf	Department :	en
designation_pdf	Designation :	en
french	French	en
german	German	en
command.create	Create	en
english	English	en
site_1	Site:	en
list_of_employees	List of Employees	en
pending	Pending	en
cleared	Cleared	en
pie_chart	Pie Chart	en
training_status	Training Status	en
bar_chart	Bar Chart	en
no_of_employees	No Of Employees	en
Site:	:[Harmonized]	en
list_of_SOPs	List of SOPs	en
RT	(RT)	en
emp.map.search	Search	en
functional_JR	Functional JR	en
message	Message	en
confirm_dialog	Confirm Dialog	en
q_	Q.	en
training_generated	Training Generated	en
the_SOP_is_mapped_at	The SOP is mapped at :	en
tni_sub_category	TNI Sub-Category:	en
location:	Location :	en
updated	Updated	en
site_phone	SitePhone:	en
site_pincode	SitePincode:	en
site_address	SiteAddress:	en
site_city	SiteCity:	en
site_state	SiteState:	en
site_country	SiteCountry:	en
site_fax	SiteFax:	en
site_status	SiteStatus:	en
in.active	inActive	en
compulsory_	[Compulsory]	en
created	Created	en
email_	Email:	en
attandance_for	Attandance for :	en
created.	created.	en
between	between	en
and	and	en
to	 --to--	en
To	To	en
all_departments	All Departments	en
all_levels	All Levels	en
report_pdf	Report.pdf	en
application_pdf	application/pdf	en
logged_in	Logged in	en
training_id	Training Id.	en
rsr.attendanc	Attendance	en
rsr.document.upload	Document Upload	en
rsr.employe.based.jr	Employe Based JR	en
rsr.employee	Employee	en
rsr.my.jrs	My JRs	en
rsr.my.tnis	My TNIs	en
rsr.notice	Notice	en
rsr.permissions	Permissions	en
rsr.test	Test	en
rsr.test.details	Test Details	en
rsr.trainer	Trainer	en
rsr.tnicategory	TNICategory	en
rsr.tniSubCategory	TNISubCategory	en
rsr.permission.tabs	Permission Tabs	en
rsr.SOP.category	SOP Category	en
rsr.view.SOP.doc	View SOP Doc	en
rsr.head.dashboard	Head Dashboard	en
rsr.hr.training	HR Training	en
rsr.view.tni.doc	View TNI Doc	en
rsr.sop.sheet.upload	SOP Sheet Upload	en
rsr.view.jr	View JR	en
rsr.training	Training	en
rsr.site	Site	en
rsr.approvals	Approvals	en
rsr.assign.jr	Assign JR	en
rsr.assign.tni	Assign TNI	en
rsr.department	Department	en
emp.map.text	Employee Mapping	en
msg.mapping_done	Mapping done.	en
e_mail	E-mail	en
additional_job_responsibilites	Additional Job Responsibilites	en
search_job_responsibilities_by	Search Job Responsibilities by	en
available_job_responsibilities	Available Job Responsibilities	en
selected_job_responsibilities	Selected Job Responsibilities	en
head(department/site)	Head(Department/Site)	en
current_password	Current Password	en
presentation_trainings_attended	Presentation Trainings attended	en
sop_trainings_attended	SOP Trainings attended	en
presentations_based_on	Presentations based on	en
select_site_for_department	Select Site for Department	en
employee_based_jrutility	Employee Based JrUtility	en
department_designation_and_roles	Department Designation and Roles	en
employee_list_cleared_training	Employee List (Cleared Training)	en
employee_list_pending_training	Employee List (Pending Training)	en
reference_document_no	Reference Document No	en
only_read_and_acknowledge	Only Read and Acknowledge	en
previous_change_control_no	Previous Change Control No.	en
presentation_description	Presentation Description	en
employees_based_on_sop	Employees Based on SOP	en
orientation_andinduction_training	ORIENTATION AND INDUCTION TRAINING RECORD	en
employees_based_on_tni	Employees Based on TNI	en
view_presentation_document	View Presentation Document	en
tni_trainings_pending	TNI Trainings Pending	en
sop_trainings_pending	SOP Trainings Pending	en
please_provide_name_id	Please provide Name/ID	en
please_provide_jr_designation	Please provide JR/Designation	en
please_provd_valid_email	Please provide valid email adddress.	en
future_date_not_allowed	Future Date not Allowed!	en
please_provide_effective_date	Please provide Effective Date.	en
please_provide_start_time_for_training	Please provide Start Time for Training!	en
please_provide_end_time_for_training	Please provide End Time for Training!	en
please_select_training_type	Please Select Training Type.	en
please_select_training_category	Please Select Training Category.	en
please_provide_refernce_doc_no	Please provide Refernce Doc. No.	en
please_provide_revision_no	Please provide Revision No.	en
only_hod_can_view_this_page	Only HOD can view this page.	en
please_specify_document_mapping	Please specify Document mapping.	en
enter_department_and_group	Enter Department and Group.	en
trainer_name	Trainer Name	en
error_occured_while_updaing_status	Error occured while updaing status!	en
please_select_atleast_one_tni	Please select atleast one TNI!	en
please_select_the_employee	Please select the employee!	en
error_while_assigning	Error while assigning!	en
error_while_creating_department	Error while creating department.	en
transfer	Ã¼bertragen	de
please_select_a_mapping	Please Select a Mapping	en
please_select_proper_value_from_the_site	Please Select a Proper Value from the Site	en
please_map_designation_to_atleast_one_site	Please map designation to atleast one site!	en
information_has_been_updated_successfully	Information has been updated successfully.	en
error_while_creating_designation	Error while creating designation!	en
mapping_already_added	Mapping already added!	en
designation_already_exists_with_name	Designation Already Exists with name	en
error_while_sending_mail	Error while sending mail.	en
user_has_been_created_successfully_error_while_sending_mail	User has been created successfully. Error while sending mail	en
user_already_exists_with_employee_id	User already exists with given employee id:	en
employee_already_mapped	Employee Already Mapped!	en
please_select_a_valid_employee	Please Select a Valid Employee	en
error_while_transferring_employee	Error while transferring Employee	en
please_specify_right_details	Please Specify Right details.	en
please_select_atleast_one_activity	Please select atleast one activity!	en
please_select_a_training	Please Select a Training.	en
no_employees_for_selected_department	No Employees For Selected Department.	en
please_provide_questions	Please provide questions.	en
sop_already_exists_for_given_refrence_document_number	SOP already exists for given Refrence Document Number	en
error_while_updating_document	Error while updating Document.	en
please_provide_document_to_upload	please provide document to upload.	en
requested_document_not_found	Requested Document not found!	en
please_select_category_to_be_removed_form_the_list	Please Select Category to be removed form the list.	en
category_already_exists	Category already exists.	en
please_select_a_valid_ref_doc_no.	Please select a valid Ref doc No.	en
error_while_saving_mapping_information	Error while saving mapping information!	en
please_select_a_message	Please select a message!	en
please_select_atleast_one_permission	Please select atleast one Permission.	en
no_such_training_found_training_date_may_have_been_expired_or_no_training_has_been_created_yet	No such Training found! Training date may have been expired or no Training has been created yet.	en
there_is_no_such_training_exists	There is no such Training exists!	en
please_select_a_valid_training	Please select a valid training!	en
error_during_saving_data	Error during saving data!	en
ERROR_WHILE_UPLOADING_SOP	ERROR WHILE UPLOADING SOP:	en
site_already_exist_with_given_name	Site Already Exist with given name	en
error_while_creating_site	Error while creating Site!	en
error_while_uploading_presenation	Error while uploading Presenation.	en
error_while_updating_presentation	Error while updating presentation.	en
some_compulsory_questions_are_left_unattempted	Some compulsory questions are left unattempted.	en
you_have_not_attempted_all_the_questions	You have not attempted all the questions.	en
error_creating_trainer	Error Creating Trainer.	en
trainer_could_not_be_updated	Trainer Could not be updated.	en
please_select_some_trainer	Please Select Some Trainer.	en
please_select_a_valid_trainer	Please select a Valid Trainer.	en
error_while_creating_attandance	Error while creating attandance..	en
document_not_available	Document not available.	en
please_select_an_employee	Please select an employee.	en
approval_status_has_been_updated_successfully	Approval status has been updated successfully.	en
information_has_been_updated	Information has been updated.	en
category_created_successfully	Category Created  successfully.	en
designation_has_been_created_successfully	Designation has been created successfully!	en
mail_sent_to_the_selected_employees	Mail sent to the selected employees.	en
user_has_been_created_successfully_password_has_been_sent_to_registered_email_address	User has been created successful. Password has been sent to registered email address.	en
mail_sent_successfully	Mail sent Successfully.	en
functional_reponsibilities_have_been_assigned	Functional reponsibilities have been assigned.	en
document_has_been_uploaded_successfully	Document has been uploaded successfully.	en
information_updated_successfully	Information updated successfully	en
notice_has_been_saved_successfully	Notice has been saved successfully.	en
permission_have_been_assigned_successfully	Permission have been assigned successfully.	en
test_data_saved_successfully	Test data saved successfully	en
presentation_uploaded_succesfully	Presentation Uploaded Succesfully.	en
tni_subcategory_created_successfully	TNI SubCategory Created Successfully.	en
trainer_created_with_name	Trainer Created With given Name.	en
trainer_updated_successfully	Trainer Updated Successfully.	en
attendance_successful	Attendance Successful..	en
department_already_exists_with_given_name	Department already exists with given name	en
Department_has_been_created_successfully	Department has been created successfully.	en
training_has_not_been_created_yet	Training has not been created yet.	en
please_select_employee	Please select employee.	en
activities_exist_choose_edit_to_update	Activities exist. Choose Edit to update.	en
username	Benutzername	de
password	Kennwort	de
tni_category_created_successfully	TNI Category Created Successfully.	en
activities_do_not_exist_choose_assign_to_assign_activities	Activities do not exist. Choose Assign to assign activities.	en
presentation_not_found	Presentation not found!	en
no_presentation_is_available	No Presentation is available.	en
no_trainings_available	No Trainings Available.	en
add_question	Frage hinzufÃ¼gen	de
please_select_a_department	Please select a Department.	en
please_select_a_designation	Please select a Designation.	en
departments_not_found	Departments not found.	en
designations_not_found	Designations not found.	en
please_select_designation	Please select designation.	en
tni_subcategory_already_exists	TNI SubCategory Already Exists.	en
trainer_already_exists	Trainer Already Exists!!	en
please_select_subcategory	Please select Sub Category.	en
please_provide_a_value_or_remove_the_field	Please provide a value or remove the field!	en
please_select_department	Please Select Department.	en
please_provide_question	Please provide question.	en
please_provide_options_in_question	Please provide options in question.	en
select_atleast_one_option	Select atleast one option.	en
please_select_a_valid_site	Please Select a Valid Site.	en
please_fill_category_name	Please Fill Category Name.	en
please_select_a_valid_category	Please select a Valid Category.	en
please_select_a_category	Please select a Category.	en
enter_department_name	Enter Department name.	en
department_exists_already	Department exists already!	en
please_map_department_to_atleast_one_site	Please map department to atleast one site.	en
enter_valid_department_name	Enter valid department name!	en
enter_department_to_edit	Enter Department to edit!	en
select_department_name	Select Department name.	en
please_select_appropriate_group	Please select appropriate group!	en
please_select_appropriate_desig	Please select appropriate Desig.	en
select_appropriate_site	select appropriate site.	en
select_appropriate_department	select appropriate department.	en
no_designations_mapped_to_selected_group	No Designations Mapped to Selected Group.	en
no_departments_available_for_selected_site	No Departments Available for Selected Site.	en
designation_not_available_for_selected_level	Designation not Available for Selected Level!!	en
select_appropriate_group	Select appropriate group.	en
please_select_a_valid_department	Please select a valid Department.	en
please_select_a_valid_designation	Please select a valid Designation.	en
select_appropriate_role	Select appropriate role.	en
role_has_already_been_assigned	Role has already been assigned.	en
please_select_appropriate_designation	please_select_appropriate_designation.	en
please_select_a_role_to_be_deleted	Please select a Role to be deleted.	en
id_already_exists_please_select_other_id	ID already exists! Please select other ID.	en
select_appropriate_salutation	Select appropriate salutation.	en
enter_employee_s_last_name	Enter employee's last name.	en
select_designation_roles	Select designation & roles.	en
please_specify_phoneNumber_for_the_employee	Please specify PhoneNumber for the Employee.	en
please_specify_qualification_for_the_employee	Please specify Qualification for the Employee.	en
enter_years_of_experience	Enter years of experience.	en
enter_date_of_joining	Enter date of joining.	en
please_add_roles_for_the_given_employee	Please Add Roles for the Given Employee.	en
please_provide_a_valid_name	Please provide a valid name.	en
please_provide_a_last_name	Please provide a last name.	en
please_provide_date_of_training	Please provide date of Training.	en
please_provide_reference_document_number	Please provide reference document number.	en
reference_document_no_already_exists	Reference Document No. already exists!	en
please_select_a_valid_refrence_document_number	Please select a Valid Refrence Document Number.	en
please_provide_SOP_name	Please provide SOP Name.	en
please_map_document_to_atleast_on_site	Please map document to atleast on site.	en
please_select_category	Please select category!	en
please_provide_document_name	Please provide document name.	en
please_select_a_reference_document_number	Please Select a Reference Document Number.	en
please_have_a_valid_revision_number	Please have a valid Revision Number.	en
please_insert_valid_change_control_number	Please Insert Valid Change Control Number.	en
please_select_a_valid_site_for_login	Please select a valid site for login!	en
please_provide_a_short_title_Maximum_100_chars	Please provide a short title.(Maximum 100 chars).	en
please_enter_description	Please enter Description.	en
message_can_not_be_empty	Message can not be empty.	en
please_select_the_test	Please select the Test.	en
please_specify_the_name_of_site	Please specify the name of Site!	en
site_already_exists_with_this_name_please_select_a_different_name	Site already exists with this name! Please select a different name.	en
please_enter_site_location	Please Enter Site Location.	en
msg.desig_created_successfully	Bezeichnung erfolgreich erstellt.	de
msg.dept_created_successfully	Abteilung erfolgreich erstellt.	de
msg.enter_site_to_edit	Bitte geben Sie Ort bearbeitet werden.	de
msg.enter_valid_sitename	Bitte geben Sie eine gÃ¼ltige Site-Namen.	de
msg.error_try_again	Error! Versuchen Sie es erneut.	de
msg.saved	Gespeichert.	de
msg.duplicate_entry	Duplicate entry.	de
msg.site_created_successfully	Website erfolgreich erstellt.	de
msg.no_match_found	Keine Ãbereinstimmung gefunden.	de
error.msg.value.valid	Die Daten sind ungÃ¼ltig!	de
status.inactive	Inaktiv	de
login	Login	de
signin	Anmeldung	de
ok	OK	de
certifications	Zertifizierungen	de
mapping	Mapping	de
site	Standorta	de
department	Abteilung	de
group	Gruppe	de
harmonic	harmonisch	de
jr_based_on	JR basierend auf	de
questions	Fragen	de
save_questions	Sparen Frage	de
remove	entfernen	de
additional_job_responsibilites	ZusÃ¤tzliche Job Verantwortungsart	de
select_employee_by	WÃ¤hlen Sie Mitarbeiter nach	de
name	Name	de
id	Identifikation	de
search_job_responsibilities_by	Suche Job Responsibilities durch	de
jr	JR	de
designation	Bezeichnung	de
search	suchen	de
available_job_responsibilities	VerfÃ¼gbare Job Responsibilities	de
selected_job_responsibilities	AusgewÃ¤hlte Job Responsibilities	de
map	Karte	de
approvals	Zulassungen	de
s.no.	S.No.	de
description	Beschreibung	de
approval_sent_for	Genehmigung geschickt fÃ¼r	de
sent_on	gesendet am	de
response_date	Antwort Datum	de
status	Status	de
action	Aktion	de
employee_id	Employee ID	de
employee_name	Name des Mitarbeiters	de
previous_roles	Vorherige Rollen	de
training	Training	de
date	Datum	de
start_time	Startzeit	de
total_questions	insgesamt Fragen	de
your_scorecard	Ihre Scorecard	de
correct_answers	richtige Antworten	de
wrong_answers	falsche Antworten	de
close	schlieÃen	de
retest	Retest	de
assign_tni	Weisen TNI	de
assign	zuweisen	de
employee	Mitarbeiter	de
select_tnis	WÃ¤hlen tnis	de
selected_tnis	ausgewÃ¤hlte tnis	de
save	sparen	de
today	heute	de
previous	frÃ¼her	de
next	nÃ¤chste	de
week	Woche	de
month	Monat	de
category_details	Kategorie Details	de
category_name	Kategorie Name	de
change_password	Kennwort Ã¤ndern	de
current_password	Current Password	de
new_password	New Password	de
conform_password	Passwort bestätigen	de
submit	einreichen	de
cancel	kÃ¼ndigen	de
employee_jrs	Mitarbeiter JRs	de
ref_doc_no	Ref.Doc.No.	de
ref_doc	Ref.Doc.	de
sop_name	SOP Namen	de
training_attended	Ausbildung absolviert	de
presentation_trainings_attended	PrÃ¤sentation Trainings teilgenommen	de
category	Kategorie	de
sub_category	Unterkategorie	de
read_acknowledge	Lesen-Acknowledge	de
test_date	Test Datum	de
attempt	Versuch	de
trainers	Trainers	de
organization	Organisation	de
phone	Telefon	de
e_mail	E-Mail-	de
sop_trainings_attended	SOP Trainings teilgenommen	de
sop	SOP	de
upcoming_trainings	Bevorstehende Trainings	de
training_topic	Ausbildung Topic	de
start_date	Startdatum	de
view_tni	Ansicht TNI	de
presentations_based_on	PrÃ¤sentationen auf der Basis	de
mapped_at	zugeordnet Zu	de
subcategory	Unterkategorie	de
dashboard	Armaturenbrett	de
select_site_for_department	WÃ¤hlen Sie Site fÃ¼r Abteilung	de
mapped_sites	mapped Seiten	de
department_head	Abteilungsleiter	de
create	schaffen	de
view	sehen	de
mapped_group	mapped Gruppe	de
edit	bearbeiten	de
name_of_designation	Name der Bezeichnung	de
active	aktiv	de
inactive	inaktiv	de
mapped_departments	mapped Abteilungen	de
compulsory	obligatorisch	de
general	General	de
new_questions	neue Fragen	de
edit_question	Frage bearbeiten	de
employee_based_jrutility	Mitarbeiter Based JrUtility	de
save_as_pdf	Speichern als PDF	de
harmonise	Harmonisierung	de
functional	Funktions-	de
department_designation_and_roles	Abteilung Bezeichnung und Rollen	de
role	Rolle	de
assigned_roles	Assigned Roles	de
employee_list_cleared_training	Employee List (Cleared Training)	de
employee_list_pending_training	Employee List (Pending Training)	de
select_all	Alles auswÃ¤hlen	de
discusit_company_details	Discus IT Pvt Ltd. Compliance Tracker @ 2012	en
last_mail_sent	Zuletzt Mail	de
send_email	E-Mail senden	de
salutation	GruÃ	de
mr	Herr	de
miss	vermissen	de
mrs	Frau	de
dr	Dr.	de
questions_added_0	Fragen HinzugefÃ¼gt: 0	de
mails_sent	Mails	de
middleame	Mitte Name	de
firstname	Erlaubnis Name	de
add	hinzufügen	de
reset	rücksetzen	de
add_certification	hinzufügen Zertifizierung	de
available_tnis	verfügbar tnis	de
select	wÃ¤hlen	de
dept	Dept	de
head	Kopf	de
roles	Rollen	de
contact_no	Kontakt Nr.	de
qualification	Qualifikation	de
date_of_joining	Datum der Verbindungstechnik	de
email	E-Mail	de
experience	Erfahrung	de
employee_resignation	Mitarbeiter Resignation	de
employee_detail	Mitarbeiter Detailansicht	de
employee_experience	Mitarbeiter Experience	de
Resign	zurÃ¼cktreten	de
employee_transfer	Employee Transfer	de
add_new_roles	Neuer Rollen	de
assign_activities	Weisen AktivitÃ¤ten	de
emp.map.text	Mitarbeiter Mapping	de
select_activities	WÃ¤hlen Sie AktivitÃ¤ten	de
selected_activities	ausgewÃ¤hlte AktivitÃ¤ten	de
hr	HR	de
topic_covered	Thema Covered	de
dashboards	Dashboards	de
admin	Admin	de
hod	HOD	de
reports	Reports	de
welcome	willkommen	de
logout	Abmelden	de
discusit_company_details	Discus IT Pvt Ltd Compliance-Tracker @ 2012	de
document_upload	Dokument hochladen	de
change_mapping	Ã¤ndern Mapping	de
type_of_document	Art des Dokuments	de
presentation	PrÃ¤sentation	de
reference_document_no	Reference Document No.	de
only_read_and_acknowledge	Nur Lesen und BestÃ¤tigen	de
next_review_date	NÃ¤chste Bewertung Datum	de
add_mappings	FÃ¼gen Mappings	de
remove_mappings	entfernen Mappings	de
upload_sop	hochladen SOP	de
add_questions	FÃ¼gen Fragen	de
uploaded_questions	Hochgeladen Fragen:	de
uploaded_sop	Hochgeladen SOP	de
revision_no	Revision Nr.	de
eff_date	Eff. Datum	de
previous_change_control_no	Vorherige Change Control No	de
change_control_no	Change Control No	de
view_uploaded_file	Anzeigen hochgeladenen Datei.	de
edit_questions	bearbeiten Fragen	de
update 	aktualisieren	de
my_tnis	Meine tnis	de
cleared_trainings	gelÃ¶scht Trainings	de
my_jrs	Meine JRs	de
reload	nachladen	de
pending_trainings	Bis Trainings	de
new_employees	New Employeese	de
emp_code	Emp. Code	de
department_and_site	Abteilung und Standort	de
notice	bemerken	de
time	Zeit	de
title	Titel	de
send 	senden	de
notice_board	Tafel	de
permissions	Berechtigungen	de
select_role	WÃ¤hlen Sie Rolle	de
test	Test	de
test_details	Test Details	de
select_test	WÃ¤hlen Sie Test	de
read_and_acknowledge	Lesen und BestÃ¤tigen	de
number_of_questions	Anzahl der Fragen	de
training_description	Training Beschreibung	de
presentation_test	Presentation-Test	de
select_presentation	WÃ¤hlen Sie Presentation	de
presentation_description	Presentation Beschreibung	de
employees_based_on_sop	Mitarbeiter SOP Basierend	de
number_of_employees	Anzahl der Mitarbeiter	de
employees	Mitarbeiter	de
available_trainings	verfÃ¼gbare Trainings	de
uploaded_sops	Hochgeladen SOPs	de
select_employee	WÃ¤hlen Mitarbeiter	de
site_	SITE	de
dept_	DEPT	de
orientation_andinduction_training	ORIENTATION und Einschulung RECORD	de
important	wichtig	de
choose_file	WÃ¤hlen Sie Datei:	de
employees_based_on_tni	Mitarbeiter am TNI Basierend	de
select_category	Kategorie auswÃ¤hlen	de
select_sub_category	WÃ¤hlen Sie Unterkategorie	de
tni_category	TNI Kategorie	de
is_active	Aktiv ist	de
tni_subcategory	TNI Unterkategorie	de
trainer_type 	Trainer Type	de
internal	intern	de
external	extern	de
middle_name	zweiter Vorname	de
surname	Familienname	de
phone_no	Telefon Nr.	de
e_mail_id	E-Mail-Id.	de
trainer	Trainer	de
attendance	Teilnahme	de
training_details	Training Details	de
trainer_id	Trainer ID	de
present	prÃ¤sentieren	de
upload_directly	Upload direkt	de
cat1	CAT1	de
cat2	CAT2	de
internal_external	Interne / Externe	de
trainer_information	Trainer Informationen	de
training_start_date	Training Startdatum	de
training_end_date	Ausbildung Enddatum	de
end_time	Endzeit	de
training_information	Informationen zu Schulungen	de
create_training_for	Neues Training fÃ¼r	de
specific_individuals	bestimmte Personen	de
mapped_employees	mapped Mitarbeiter	de
assign_training	Weisen Ausbildung	de
view_sop_document	Anzeigen SOP Document	de
lastName	letzte Name	de
experience_years	Erfahrung(Jahre)	de
end_date	Ende datum	de
trainings	Schulungen	de
name_of_trainer	Name von Trainer	de
new	Neu	de
replace	Ersetzen	de
available_activities	verfügbar Aktivitäten	de
for_department	für Abteilung	de
additional_links	zusätzlich Links	de
view_sop	Ansicht SOP	de
reference_doc_no	Referenz Doc. Nein.	de
harmonized	Harmonized	de
view_presentation_document	Anzeigen Presentation Document	de
tni_training_status	TNI Trainingszustand	de
sop_training_status	SOP Trainingszustand	de
S_O_P	S.O.P	de
forgot_password	Passwort vergessen	de
trainer_info	Trainer Info	de
training_dates	Schulungstermine	de
training_time	Training Time	de
tni	TNI	de
please_provide_name_id	Bitte geben Sie Name / ID	de
please_provide_jr_designation	Bitte geben JR / Bezeichnung	de
please_provd_valid_email	Bitte geben Sie gÃ¼ltige E-Mail-adddress.	de
future_date_not_allowed	Future Datum nicht erlaubt!	de
Department Head	Abteilungsleiter	de
please_provide_effective_date	Bitte geben Effective Date.	de
please_provide_start_time_for_training	Bitte geben Sie Startzeit fÃ¼r Training!	de
please_provide_end_time_for_training	Bitte geben End Time for Training!	de
please_select_training_type	Â Bitte wÃ¤hlen Ausbildung Type.	de
please_select_training_category	Â Bitte wÃ¤hlen Training Kategorie.	de
please_provide_refernce_doc_no	Â Bitte geben Referenzprojekt Doc. Nein.	de
please_provide_revision_no	Bitte geben Revision Nr.	de
not_defined	definiert	de
no_certifications	Keine Zertifizierungen	de
please_specify_document_mapping	Bitte geben Sie Document Mapping.	de
enter_group	Geben Group.	de
enter_department_and_group	Geben Abteilung und Gruppe.	de
enter_department	Geben Abteilung.	de
error_occured_while_updaing_status	Fehler beim updaing Status!	de
please_select_atleast_one_tni	Bitte wÃ¤hlen Sie atleast ein TNI!	de
please_select_the_employee	Bitte wÃ¤hlen Sie den Mitarbeiter!	de
error_while_assigning	Fehler beim Zuordnen!	de
error	Error.	de
no_tests_found	Keine Tests gefunden!	de
no_record_found	Kein Eintrag gefunden.	de
error_while_creating_department	Fehler beim Erstellen Abteilung.	de
please_select_a_mapping	Bitte wÃ¤hlen Sie eine Mapping	de
please_select_proper_value_from_the_site	Bitte wÃ¤hlen einen geeigneten Wert von der Website	de
please_map_designation_to_atleast_one_site	Bitte map Bezeichnung an einem Standort atleast!	de
information_has_been_updated_successfully	Informationen wurden erfolgreich aktualisiert.	de
error_while_creating_designation	Fehler beim Erstellen Abteilung.	de
mapping_already_added	Mapping bereits hinzugefÃ¼gt!	de
designation_already_exists_with_name	Bezeichnung existiert bereits mit Namen	de
error_while_sending_mail	Fehler beim Versenden.	de
user_has_been_created_successfully_error_while_sending_mail	Benutzer wurde erfolgreich erstellt. Fehler beim Versenden der	de
user_already_exists_with_employee_id	Benutzer existiert bereits mit bestimmten Mitarbeiter-ID:	de
employee_already_mapped	Mitarbeiter bereits zugeordnet!	de
please_select_a_valid_employee	Bitte wÃ¤hlen Sie eine gÃ¼ltige Mitarbeiter	de
error_while_updating	Fehler bei der Aktualisierung!	de
record_already_added	Datensatz bereits hinzugefÃ¼gt!	de
error_while_transferring_employee	Fehler wÃ¤hrend der Ãbertragung an Arbeitnehmer	de
please_specify_right_details	Bitte geben Sie rechts Details.	de
please_select_atleast_one_activity	Bitte wÃ¤hlen Sie atleast eine AktivitÃ¤t!	de
please_select_a_training	Bitte wÃ¤hlen Sie eine Training.	de
no_departments_found	Keine Departments gefunden ..	de
no_employees_for_selected_department	Keine Arbeitnehmerentgelt fÃ¼r ausgewÃ¤hlte Abteilung.	de
no_trainings_found	Keine Trainings gefunden.	de
please_provide_questions	Bitte Fragen.	de
sop_already_exists_for_given_refrence_document_number	SOP existiert bereits fÃ¼r bestimmte Refrence Document Numbe	de
error_while_updating_document	Fehler beim Aktualisieren Dokument.	de
please_provide_document_to_upload	Bitte geben Dokument hochladen.	de
requested_document_not_found	ErwÃ¼nschte Dokument nicht gefunden!	de
please_select_category_to_be_removed_form_the_list	Bitte wÃ¤hlen Kategorie entfernt bilden die Liste werden.	de
category_already_exists	Kategorie existiert bereits.	de
please_select_a_valid_ref_doc_no.	Bitte wÃ¤hlen Sie eine gÃ¼ltige Ref doc Nr.	de
error_while_saving_mapping_information	Fehler beim Speichern der Mapping-Informationen!	de
unknown_error	Unknown Error!	de
please_select_a_message	Bitte wÃ¤hlen Sie eine Nachricht!	de
please_select_a_role	Bitte wÃ¤hlen Sie eine Rolle.	de
please_select_atleast_one_permission	Bitte wÃ¤hlen Sie atleast ein Permission.	de
no_such_training_found_training_date_may_have_been_expired_or_no_training_has_been_created_yet	Keine solche Ausbildung gefunden! Ausbildung Datum kann abgelaufen oder keine Ausbildung wurde noch nicht erstellt.	de
there_is_no_such_training_exists	Es gibt keine solche Ausbildung existiert!	de
please_select_a_valid_training	Bitte wÃ¤hlen Sie eine gÃ¼ltige Training!	de
sop_not_found	Sop wurde nicht gefunden!	de
document_not_found	Dokument nicht gefunden!	de
error_during_saving_data	Fehler beim Speichern von Daten!	de
ERROR_WHILE_UPLOADING_SOP	Fehler beim Hochladen SOP:	de
no_category_exist	Keine Kategorie vorhanden.	de
please_select_a_file	Bitte wÃ¤hlen Sie eine Datei.:	de
site_already_exist_with_given_name	Website bereits mit Vornamen Exist	de
error_while_creating_site	Fehler beim Erstellen der Site!	de
tni_trainings_pending	TNI Schulungen anstehend	de
select_sop	aussuchen SOP	de
b	questions must be provided!	en
only_hod_can_view_this_page	Nur HOD können anzeigen Seite.	de
error_while_uploading_presenation	Fehler beim Hochladen ModerationszubehÃ¶r.	de
error_while_updating_presentation	Fehler beim Aktualisieren PrÃ¤sentation.	de
some_compulsory_questions_are_left_unattempted	Einige obligatorischen Fragen bleiben unversucht.	de
status.active	Aktiv	de
you_have_not_attempted_all_the_questions	Sie haben nicht alle Fragen versucht.	de
error_creating_trainer	Fehler beim Erstellen Trainer.	de
trainer_could_not_be_updated	Trainer konnte nicht aktualisiert werden.	de
please_select_some_trainer	Bitte wÃ¤hlen Sie einige Trainer.	de
please_select_a_valid_trainer	Bitte wÃ¤hlen Sie eine gÃ¼ltige Trainer.	de
no_trainer_found	Kein Trainer gefunden ..	de
emp.create	Erstellen Mitarbeiter	de
error_while_creating_attandance	Fehler beim Erstellen der Messeteilnahme ..	de
no_tnis_found	Keine tnis gefunden.	de
document_not_available	Dokument nicht verfÃ¼gbar.	de
please_select_an_employee	Bitte wÃ¤hlen Sie einen Mitarbeiter.	de
approval_status_has_been_updated_successfully	Genehmigungsstatus wurde erfolgreich aktualisiert.	de
activity_included	AktivitÃ¤t enthalten.	de
information_has_been_updated	Informationen aktualisiert wurde.	de
category_created_successfully	Kategorie erfolgreich erstellt.	de
removed	entfernt	de
designation_has_been_created_successfully	Bezeichnung wurde erfolgreich erstellt!	de
mail_sent_to_the_selected_employees	Mail an den ausgewÃ¤hlten Mitarbeiter.	de
user_has_been_created_successfully_password_has_been_sent_to_registered_email_address	Benutzer erstellt wurde erfolgreich. Passwort wurde an registrierte E-Mail-Adresse gesendet.	de
mail_sent_successfully	Mail erfolgreich versendet.	de
functional_reponsibilities_have_been_assigned	Funktionelle reponsibilities zugewiesen wurden.	de
hr_training_created	HR Training Erstellt.	de
document_has_been_uploaded_successfully	Dokument wurde erfolgreich hochgeladen.	de
information_updated_successfully	Informationen erfolgreich aktualisiert	de
notice_has_been_saved_successfully	Hinweis wurde erfolgreich gespeichert.	de
message_saved	Nachricht gespeichert	de
permission_have_been_assigned_successfully	Permission wurden erfolgreich zugeordnet.	de
test_data_saved_successfully	Testdaten erfolgreich gespeichert	de
sops_uploaded_successfully	SOPs erfolgreich hochgeladen.	de
site_has_been_created_successfully	Seite wurde erfolgreich erstellt.	de
tni_category_created_successfully	TNI Kategorie erfolgreich erstellt.	de
presentation_uploaded_succesfully	Presentation Hochgeladen Erfolgreich	de
tni_subcategory_created_successfully	TNI Unterkategorie erfolgreich erstellt.	de
trainer_created_with_name	Trainer mit Vornamen Erstellt am:	de
trainer_updated_successfully	Trainer erfolgreich aktualisiert.	de
attendance_successful	Teilnahme Erfolgreiche ..	de
department_already_exists_with_given_name	Abteilung existiert bereits mit Vornamen	de
Department_has_been_created_successfully	Abteilung wurde erfolgreich erstellt.	de
training_has_not_been_created_yet	Training wurde noch nicht erstellt.	de
please_select_employee	Bitte wÃ¤hlen Sie Mitarbeiter.	de
no_available_jr	Nein VerfÃ¼gbar JR!	de
activities_exist_choose_edit_to_update	AktivitÃ¤ten existieren. WÃ¤hlen Sie Bearbeiten, um zu aktualisieren.	de
activities_do_not_exist_choose_assign_to_assign_activities	AktivitÃ¤ten gibt es nicht. WÃ¤hlen Sie zuweisen TÃ¤tigkeiten zuweisen.	de
presentation_not_found	PrÃ¤sentation wurde nicht gefunden!	de
no_employees_found	Keine Mitarbeiter gefunden!	de
no_record_available	Keine Aufnahme verfÃ¼gbar.	de
no_presentation_is_available	Keine PrÃ¤sentation zur VerfÃ¼gung.	de
no_trainings_available	Keine Trainings verfÃ¼gbar.	de
please_select_an_sop	Bitte wÃ¤hlen Sie einen SOP.	de
trainings_not_found	Trainings nicht gefunden!	de
please_select_a_site	Bitte wÃ¤hlen Sie eine Site.	de
please_select_a_department	Bitte wÃ¤hlen Sie eine Abteilung.	de
please_select_a_designation	Bitte wÃ¤hlen Sie eine Bezeichnung.	de
sites_not_found	Seiten nicht gefunden.	de
departments_not_found	Abteilungen nicht gefunden.	de
designations_not_found	Bezeichnungen nicht gefunden.	de
please_select_designation	Bitte wÃ¤hlen Sie Bezeichnung.	de
employees_not_found	Mitarbeiter nicht gefunden.	de
tni_subcategory_already_exists	TNI Unterkategorie existiert bereits.	de
trainer_already_exists	Trainer ist bereits vorhanden!	de
please_select_SOP	Bitte wÃ¤hlen SOP.	de
please_select_subcategory	Bitte wÃ¤hlen Sie Sub Kategorie.	de
please_provide_a_value_or_remove_the_field	Bitte geben Sie einen Wert oder entfernen Sie das Feld!	de
duplicate_values	Doppelte Werte!	de
please_select_site	Bitte wÃ¤hlen Site.	de
please_select_department	Bitte wÃ¤hlen Abteilung.	de
please_select_group	Bitte wÃ¤hlen Group.	de
please_provide_question	Bitte geben Frage.	de
please_provide_options_in_question	Bitte geben Optionen in Frage.	de
select_atleast_one_option	WÃ¤hlen Sie atleast eine Option.	de
please_select_a_valid_site	Bitte wÃ¤hlen Sie eine gÃ¼ltige Site.	de
dept_does_not_exist	Abteilung nicht existiert.	de
please_fill_category_name	Bitte fÃ¼llen Kategorie Name.	de
please_select_a_valid_category	Bitte wÃ¤hlen Sie eine gÃ¼ltige Kategorie.	de
please_select_a_category	Bitte wÃ¤hlen Sie eine Kategorie.	de
enter_employee_id	Geben Sie die Mitarbeiter-ID.	de
enter_department_name	Geben Abteilung Namen.	de
department_exists_already	Abteilung existiert bereits!	de
please_map_department_to_atleast_one_site	Bitte map Abteilung an einem Standort atleast.	de
enter_valid_department_name	Geben Sie eine gÃ¼ltige Name der Abteilung!	de
enter_department_to_edit	Geben Abteilung zu bearbeiten!	de
select_department_name	WÃ¤hlen Sie einen Fachbereich Namen.	de
please_select_appropriate_group	Bitte wÃ¤hlen Sie die entsprechende Gruppe!	de
please_select_appropriate_desig	Bitte wÃ¤hlen Sie entsprechende Desig.	de
select_appropriate_site	wÃ¤hlen Sie die entsprechende Website.	de
select_appropriate_department	wÃ¤hlen Sie die entsprechende Abteilung.	de
no_designations_mapped_to_selected_group	Keine Bezeichnungen zu ausgewÃ¤hlten Gruppe zugeordnet.	de
no_departments_available_for_selected_site	Keine Departments fÃ¼r ausgewÃ¤hlte Site.	de
designation_not_available_for_selected_level	Bezeichnung im gewÃ¤hlten Stufe!	de
select_appropriate_group	WÃ¤hlen Sie die entsprechende Gruppe.	de
enter_designation	Geben Sie Bezeichnung.	de
please_select_a_valid_department	Bitte wÃ¤hlen Sie eine gÃ¼ltige Abteilung.	de
please_select_a_valid_designation	Bitte wÃ¤hlen Sie eine gÃ¼ltige Bezeichnung.	de
please_select_a_valid_role	Bitte wÃ¤hlen Sie eine gÃ¼ltige Rolle.	de
select_appropriate_role	WÃ¤hlen Sie die entsprechende Rolle.	de
role_has_already_been_assigned	Rolle ist bereits vergeben.	de
please_select_appropriate_designation	please_select_appropriate_designation.	de
please_select_a_role_to_be_deleted	Bitte wÃ¤hlen Sie eine Rolle gelÃ¶scht werden.	de
please_enter_only_numeric_values_for_pincode	Please Enter Only Numeric Values for Pincode.	en
id_already_exists_please_select_other_id	ID existiert bereits! Bitte wÃ¤hlen Sie eine andere ID.	de
please_provide_a_name_for_category	Please Provide a Name for Category.	en
no_categories_available_please_enter_category_first	No Categories Available. Please Enter Category First.	en
presentations_dont_exist_please_insert_a_presentation	Presentations Dont exist.Please insert a presentation.	en
please_insert_a_valid_description	Please Insert a valid description.	en
please_have_some_valid_values	Please have some Valid Values.	en
please_select_site_to_map_the_presentation	Please Select Site to Map the Presentation.	en
please_select_department_to_map_the_presentation	Please Select Department to Map the Presentation.	en
please_select_designation_to_map_the_presentation	Please Select Designation to Map the Presentation.	en
presentation_exist_for_this_subCategory_please_go_to_edit	Presentation exist for this SubCategory.Please go to edit.	en
please_select_a_subCategory	Please Select a SubCategory.	en
please_select_category_and_subCategory_to_edit_questions	Please Select Category and SubCategory To Edit Questions.	en
please_select_category_and_subCategory_to_view_uploaded_files	Please Select Category and SubCategory to View Uploaded Files.	en
please_provide_subcategory_name	Please Provide SubCategory Name.	en
please_select_category_name	Please Select Category Name.	en
please_select_trainer_type	Please Select Trainer Type.	en
select_appropriate_salutation	WÃ¤hlen Sie die passende Anrede.	de
please_select_salutation	Please select Salutation.	en
please_provide_surname	Please provide surname.	en
please_provide_phone_no	Please provide Phone no.	en
enter_employee_name	Geben Sie Name des Mitarbeiters.	de
please_provide_organization	Please provide Organization.	en
please_provide_designation	Please provide Designation.	en
please_provide_experience	Please provide Experience.	en
please_provide_experience_in_years_in_number	Please provide experience (in years) in number.	en
no_employee_available_for_selected_training	No Employee Available for Selected Training.	en
no_employees_for_selected_training	No Employees for Selected Training.	en
enter_employee_s_last_name	Geben Mitarbeiters Nachnamen.	de
please_provide_start_date	Please Provide Start Date.	en
select_designation_roles	WÃ¤hlen Sie Bezeichnung und Rollen.	de
please_select_type_of_training	Please Select Type of Training.	en
please_select_reference_document_number	Please Select Reference Document Number.	en
please_select_trainer	Please Select Trainer.	en
please_provide_training_topic	Please Provide Training Topic.	en
please_provide_end_date	Please Provide End Date.	en
please_assgin_employee_for_the_training	Please Assgin Employee for the Training.	en
start_time_can_not_be_less_than_end_time	Start Time can not be less than End Time!	en
please_select_a_valid_trainer_value	Please select a Valid Trainer Value.	en
please_provide_a_date_comes_after_start_date	Please provide a date, comes after Start Date	en
enter_contact_number	Geben Sie eine Telefonnummer.	de
please_provide_a_date_comes_before_effective_date	Please provide a date, comes before Effective Date	en
department_does_not_exixts	Department does not exixts.	en
designation_does_not_exixts	Designation does not exixts.	en
please_select_a_valid_group	Please Select a Valid Group.	en
enter_email_address	Geben Sie E-Mail-Adresse.	de
training_report_title	Trainings and Reports	en
please_specify_phoneNumber_for_the_employee	Bitte geben Sie PhoneNumber fÃ¼r die Mitarbeiter.	de
please_specify_qualification_for_the_employee	Bitte geben Qualifikation fÃ¼r die Mitarbeiter.	de
enter_years_of_experience	Geben Jahren Erfahrung.	de
enter_date_of_joining	Geben Sie das Datum des Beitritts.	de
please_add_roles_for_the_given_employee	Bitte Rollen hinzufÃ¼gen fÃ¼r den jeweiligen Arbeitnehmer	de
please_provide_a_valid_name	Bitte geben Sie einen gÃ¼ltigen Namen.	de
please_provide_a_last_name	Bitte geben Sie einen Nachnamen.	de
please_provide_date_of_training	Bitte geben Sie Datum Training.	de
please_provide_reference_document_number	Bitte geben Referenzbelegnummer.	de
reference_document_no_already_exists	Reference Document No existiert bereits!	de
please_select_a_valid_refrence_document_number	Bitte wÃ¤hlen Sie eine gÃ¼ltige Refrence Document Number.	de
please_provide_SOP_name	Bitte geben SOP Name.	de
please_map_document_to_atleast_on_site	Bitte map Dokument auf Seite atleast.	de
msg.enter_dept_to_search	Please enter department to be searched!	en
msg.desig_created_successfully	Designation created successfully.	en
msg.dept_created_successfully	Department created successfully.	en
msg.enter_site_to_edit	Please enter site to be edited.	en
msg.enter_valid_sitename	Please enter a valid site name.	en
please_select_category	Bitte Kategorie auswÃ¤hlen!	de
please_provide_document_name	Bitte geben Sie Namen des Dokuments.	de
please_select_a_reference_document_number	Bitte wÃ¤hlen Sie eine Reference Document Number.	de
msg.site_created_successfully	Site created successfully.	en
please_have_a_valid_revision_number	Bitte eine gÃ¼ltige Revisionsnummer.	de
error.msg.value.valid	The data is invalid!	en
error.msg.value.required	The field can not be left blank!	en
please_insert_valid_change_control_number	Bitte legen Sie gÃ¼ltige Change Control-Nummer	de
please_select_a_valid_site_for_login	Bitte wÃ¤hlen Sie eine gÃ¼ltige Website fÃ¼r die Anmeldung!	de
please_enter_title	Bitte geben Sie Titel.	de
please_provide_a_short_title_Maximum_100_chars	Bitte geben Sie einen kurzen Titel. (Maximum 100 Zeichen)	de
please_enter_description	Bitte geben Sie Beschreibung.	de
message_can_not_be_empty	Nachricht kann nicht leer sein.	de
please_select_the_test	Bitte wÃ¤hlen Sie den Test.	de
please_specify_the_name_of_site	Bitte geben Sie den Namen der Site!	de
site_already_exists_with_this_name_please_select_a_different_name	Website bereits mit diesem Namen existiert! Bitte wÃ¤hlen Sie einen anderen Namen.	de
enter_site_name	Geben Sie Site-Namen.	de
enter_site_address	Geben Sie Website-Adresse.	de
please_enter_site_location	Bitte geben Sie Site Location.	de
enter_city	Geben Stadt.	de
enter_state	Geben Zustand.	de
enter_country	Geben Land.	de
enter_pincode	Geben Sie PIN-Code.	de
enter_phone_number	Rufnummer eingeben.	de
enter_fax_number	Faxnummer eingeben.	de
please_enter_only_numeric_values_for_pincode	Bitte geben Sie nur numerische Werte fÃ¼r Pincode.	de
select_a_valid_site	WÃ¤hlen Sie eine gÃ¼ltige site!	de
exp.msg.please_enter_date_gt_effdate	Please enter a date greater than the date specified as Effective Date!	en
error.msg.please_provide_name	Please provide name.	en
error.msg.please_enter_valid_email	Please enter valid e-mail.	en
please_provide_a_name_for_category	Bitte geben Sie einen Namen fÃ¼r die Kategorie.	de
msg.employee_updated_successfully	Employee record updated successfully.	en
msg.employee_record_successfully_created	Employee record created successfully.	en
msg.please_select_designation	Employee record updated successfully.	en
no_categories_available_please_enter_category_first	Keine Kategorien verfÃ¼gbar. Bitte geben Sie Kategorie First.	de
exp.enter_the_site_to_search	Please enter the site to be searched!	en
exp.please_enter_valid_destination_name	Please provide valid destination name!	en
exp.please_select_desig_to_search	Please select the designation to be searched!	en
error.msg.please_enter_valid-10digit_phone_number	Please enter 10 digit valid Phone number!	en
error.msg.please_enter_valid-6digit_pincode	Please enter 6 digit valid Pincode!	en
presentations_dont_exist_please_insert_a_presentation	PrÃ¤sentationen Dont exist.Please legen Sie eine PrÃ¤sentation.	de
error.msg.please_provide_valid_date	Please enter valid date!	en
msg.please_enter_surname	Please enter surname.	en
msg.employee_not_mapped_yet	Employee has not been mapped yet.	en
msg.employee_does_not_exist	Employee does not exist.	en
msg.dept_does_not_exist	Department does not exist.	en
exp.please_select_department	Please select department.	en
msg.site_does_not_exist	Site does not exist.	en
exp.please_select_site	Please select a Site.	en
training.assessment.no	No	en
please_insert_a_valid_description	Bitte geben Sie eine gÃ¼ltige Beschreibung.	de
training.type.classroom	Class Room	en
please_have_some_valid_values	Bitte haben Sie einige gÃ¼ltige Werte.	de
training.type.on_job_training	On Job Training	en
please_select_site_to_map_the_presentation	Bitte wÃ¤hlen Site, um die PrÃ¤sentation auf der Karte.	de
please_select_department_to_map_the_presentation	Bitte wÃ¤hlen Abteilung, um die PrÃ¤sentation auf der Karte.	de
please_select_designation_to_map_the_presentation	Bitte wÃ¤hlen Bezeichnung, um die PrÃ¤sentation auf der Karte.	de
error.msg.value.required	Das Feld darf nicht leer sein!	de
training.assessment.yes	Yes	en
training.date.implementation	Date of Implementation	en
error.msg.please_provide_training	Please Provide training	en
training.date.effective	Effective Date	en
training.sel.sitespecific	Site Specific	en
training.sel.deptspecific	Department Specific	en
training.sel.desigspecific	Designation Specific	en
training.sel.rolespecific	Role Specific	en
training.sel.empspecific	Employee Specifi	en
field_can_not_be_left_empty	Field can not be left empty!	en
no_blocked_test_found	No Blocked Test Found.	en
please_provide_current_password	Please provide current password.	en
please_provide_new_password	Please provide new password.	en
password_has_been_changed_successfully	Password has been changed successfully.	en
no_harmonized_activities_mapped_at_the_moment	No Harmonized Activities Mapped at the moment.	en
no_functional_activities_mapped_at_the_moment	No Functional Activities Mapped at the moment.	en
list_of_harmonized_SOP	List of Harmonized SOP	en
list_of_functional_SOP	List of Functional SOP	en
presentation_exist_for_this_subCategory_please_go_to_edit	PrÃ¤sentation fÃ¼r diese SubCategory.Please gehen zu bearbeiten gibt.	de
please_select_a_subCategory	Bitte wÃ¤hlen Sie eine Unterkategorie.	de
please_select_category_and_subCategory_to_edit_questions	Bitte wÃ¤hlen Kategorie und Unterkategorie Um Fragen bearbeiten.	de
please_select_category_and_subCategory_to_view_uploaded_files	Bitte wÃ¤hlen Kategorie und Unterkategorie zu den hochgeladenen Dateien anzeigen.	de
please_provide_subcategory_name	Bitte geben Unterkategorie Name.	de
please_select_category_name	Bitte wÃ¤hlen Kategorie Name.	de
please_select_trainer_type	Bitte wÃ¤hlen Trainer Type.	de
pending_tni_trainings	Pending TNI Trainings	en
pending_SOP_trainings	Pending SOP Trainings	en
please_provide_id	Bitte geben Sie ID.	de
please_select_salutation	Bitte wÃ¤hlen Sie Anrede.	de
login_Error_please_enter_valid_username_and_password_along_with_your_site	Login Error: Please enter valid username and password along with your Site	en
please_provide_surname	Bitte geben Nachnamen.	de
please_provide_phone_no	Bitte geben Sie Telefon-Nr.	de
this_is_your_last_attempt	This is your last Attempt.	en
please_provide_email	Bitte E-Mail.	de
do_you_want_to_sumbit_your_test	Do you want to sumbit your test?	en
please_provide_organization	Bitte geben Organization.	de
please_provide_designation	Bitte geben Sie Bezeichnung.	de
test_can_not_be_generated_your_blocked_test_has_not_been_approved_please_contact_to_head	Test can not be generated. Your Blocked Test Has Not Been Approved. Please contact to your Department Head.	en
test_can_not_be_generated_you_have_already_attempted_3_times_please_contact_to_your_department_head	Test can not be generated. You have already attempted 3 times. Please contact to your Department Head.	en
please_provide_experience	Bitte geben Experience.	de
wrong_file_format_please_select_excel_file	Wrong File format. Please select Excel file.	en
please_provide_experience_in_years_in_number	Bitte geben Sie Erfahrung (in Jahren) in der Anzahl.	de
no_employee_available_for_selected_training	Kein Mitarbeiter fÃ¼r ausgewÃ¤hlte Training.	de
no_employees_for_selected_training	Keine Mitarbeiter fÃ¼r ausgewÃ¤hlte Training.	de
no_activities_available_for_selected_category_and_training_type	Keine AktivitÃ¤ten fÃ¼r ausgewÃ¤hlte Kategorie und Training Type	de
no_trainer_available	Kein Trainer verfÃ¼gbar!	de
please_provide_start_date	Bitte geben Sie Startdatum.	de
please_select_a_date	Bitte wÃ¤hlen Sie einen Termin.	de
please_select_type_of_training	Bitte wÃ¤hlen Art des Training.	de
please_select_reference_document_number	Bitte wÃ¤hlen Reference Document Number.	de
please_select_trainer	Bitte wÃ¤hlen Trainer.	de
please_provide_training_topic	Bitte geben Schulungen Topic.	de
please_provide_end_date	Bitte geben End Date.	de
please_assgin_employee_for_the_training	Bitte Assgin Mitarbeiter fÃ¼r das Training.	de
start_time_can_not_be_less_than_end_time	Startzeit kann nicht kleiner sein als End Time!	de
please_select_a_valid_trainer_value	Bitte wÃ¤hlen Sie eine gÃ¼ltige Trainer-Wert.	de
please_provide_a_date_comes_after_start_date	Bitte geben Sie ein Datum, kommt nach dem Startdatum.	de
hr_departments	Abteilungen	de
trainer_organization_updated	Trainer organization updated	en
trainer_designation_updated	Trainer designation updated	en
trainer_experience_updated	Trainer experience updated	en
please_provide_a_date_comes_before_effective_date	Bitte geben Sie ein Datum, kommt vor Effective Date .	de
department_does_not_exixts	Abteilung nicht exixts.	de
designation_does_not_exixts	Bezeichnung nicht exixts.	de
please_select_a_valid_group	Bitte wÃ¤hlen Sie eine gÃ¼ltige Group.	de
bblocked_tests	Blockierte Tests	de
training_report_title	Â Trainings und Berichte	de
list_of_presentations	List of Presentations	en
item_data	Â Daten	de
item_report	Â Bericht	de
site_maintanance	Â Website Maintainance	de
company.name	Firmenname	de
emp_mapping	Â Mitarbeiter Mapping	de
deployment	Â Einsatz	de
rsr.employee.dashboard	EmployeeDashboard	en
maintenance_panel	Wartung Systemsteuerung	de
rsr.employee.transfer	Employee Transfer	en
emp_panel	Â Mitarbeiter-Panel	de
address	Adresse	de
city	City	de
state	Zustand	de
site.create	Website erstellen	de
site.view	Anzeigen Site	de
site.update	Update-Website	de
rsr.presentation.test	Presentation Test	en
rsr.presentation.test.details	Presentation Test Details	en
rsr.presentation Upload	Presentation Upload	en
site.location	Site Location	de
site.name	Site Name	de
site.search	Suchen	de
mapped.sites	Mapped Seiten	de
dept.text	Abteilung	de
rsr.designation.group	Designation Group	en
dept.name	Name der Abteilung	de
dept.view	UniversitÃ¤tsklinik	de
dept.search	Abteilung	de
dept.update	Update Abteilung	de
dept.mapng	Mapped Abteilungen	de
desig.text	Bezeichnung	de
desig.name	Name der Bezeichnung	de
desig.view	Anzeigen Bezeichnung	de
rsr.view.presentations	View Presentations	en
desig.create	Erstellen Bezeichnung	de
desig.edit	Bearbeiten Bezeichnung	de
desig.search	Suche Bezeichnung	de
tab.view	Sehen	de
tab.create	Schaffen	de
tab.edit	Bearbeiten	de
emp.text	Mitarbeiter	de
emp.view	Zeige Mitarbeiter	de
msg.enter_dept_to_search	Bitte geben Abteilung gesucht!	de
command.remove	Entfernen	de
command.add.remove	HinzufÃ¼gen / entfernen	de
command.save	Sparen	de
emp.detail	Mitarbeiter Detailansicht	de
emp.dob	Geburtsdatum	de
emp.doj	Datum der Verbindungstechnik	de
emp.mail	E-Mail	de
emp.surname	Familienname	de
emp.id	Identifikation	de
emp.search	Suche Mitarbeiter	de
emp.edit	Mitarbeiter bearbeiten	de
emp.name	Name des Mitarbeiters	de
msp.please_enter_address 	Bitte geben Sie Adresse.	de
msg.error_while_updating	Fehler bei der Aktualisierung.	de
msg.please_enter_name	Bitte geben Sie Namen.	de
exp.please_provide_empid	Bitte geben Employee ID.	de
msg.mapping_done	Mapping durchgefÃ¼hrt.	de
emp.map.search	Suchen	de
msg.desig_does_not_exist	Bezeichnung existiert nicht.	de
msg.employee_already_mapped	Mitarbeiter wurde bereits abgebildet.	de
exp.msg.please_enter_date_gt_effdate	Bitte geben Sie ein Datum grÃ¶Ãer als das Datum als Stichtag angegeben!	de
error.msg.please_provide_name	Bitte geben Sie Namen.	de
error.msg.please_enter_valid_email	Bitte geben Sie eine gÃ¼ltige E-Mail.	de
command.update	Aktualisieren	de
msg.employee_updated_successfully	Mitarbeiterdatensatz erfolgreich aktualisiert.	de
msg.employee_record_successfully_created	Mitarbeiterdatensatz erfolgreich erstellt.	de
msg.please_select_designation	Bitte wÃ¤hlen Sie Bezeichnung.	de
exp.enter_the_site_to_search	Bitte geben Sie die Website gesucht werden!	de
exp.please_enter_valid_destination_name	Bitte geben Sie gÃ¼ltige Zielnamen!	de
exp.please_select_desig_to_search	Bitte wÃ¤hlen Sie die Bezeichnung gesucht werden!	de
error.msg.please_enter_valid-10digit_phone_number	Bitte geben Sie 10-stellige gÃ¼ltige Telefonnummer!	de
error.msg.please_enter_valid-6digit_pincode	Bitte geben Sie 6-stelligen Pincode gÃ¼ltig!	de
error.msg.fax_number	Bitte geben Sie 10-stellige gÃ¼ltige Faxnummer!	de
error.msg.please_provide_valid_date	Bitte geben Sie eine gÃ¼ltige date!	de
msg.please_enter_surname	Bitte geben Sie Namen.	de
msg.employee_not_mapped_yet	Mitarbeiter wurde noch nicht zugeordnet.	de
msg.employee_does_not_exist	Mitarbeiter existiert nicht.	de
msg.dept_does_not_exist	Abteilung nicht existiert.	de
exp.please_select_department	Bitte wÃ¤hlen Sie Abteilung.	de
msg.site_does_not_exist	Website existiert nicht.	de
exp.please_select_site	Bitte wÃ¤hlen Sie eine Site.	de
training.assessment.no	Nicht	de
training.name	Training Namen	de
training.type.classroom	Class Room	de
training.search	Suchen	de
desig.roles	Rollen	de
training.edit	Bearbeiten Ausbildung	de
training.text	Training	de
training.assessment	Beurteilung	de
training.assessment.yes	Ja	de
training.date.implementation	Datum der Umsetzung	de
error.msg.please_provide_training	Bitte geben Weiterbildung	de
training.date.effective	Datum des Inkrafttretens	de
training.create	Erstellen Ausbildung	de
training.view	Sehen Ausbildung	de
training.type	Art der Ausbildung	de
training.sel.sitespecific	Site Specific	de
training.sel.all	Alle	de
training.sel.deptspecific	Abteilung Spezifische	de
training.sel.desigspecific	Bezeichnung Spezifische	de
training.sel.rolespecific	Role Spezifische	de
training.sel.empspecific	Mitarbeiter Spezifische	de
category.create	Kategorie erstellen	de
category.name	Â Kategorie Name	de
field_can_not_be_left_empty	Â Feld kann nicht leer bleiben!	de
remove_question	Entfernen Frage	de
questions_added	Fragen am:	de
question	Frage	de
no_jr_is_selected	Kein JR ist ausgewÃ¤hlt!	de
approve	Genehmigen	de
disapprove	Missbilligen	de
_fail	% Fail-	de
_pass	% Pass	de
unblock	Unblock	de
no_blocked_test_found	Kein Blockierte-Test gefunden.	de
in_Active	In-Active	de
no_category_exists	Keine Kategorie vorhanden	de
please_provide_current_password	Bitte geben aktuelle Passwort ein.	de
please_provide_new_password	Bitte neues Passwort.	de
please_confirm_the_password	Bitte bestÃ¤tigen Sie das Passwort ein.	de
passwords_do_not_match	PasswÃ¶rter stimmen nicht Ã¼berein!	de
password_has_been_changed_successfully	Passwort erfolgreich geÃ¤ndert wurde.	de
password_is_wrong	Kennwort ist falsch!	de
yes	Ja	de
no	Nicht	de
n_a	N / A	de
command.add	hinzufügen	de
command.reset	rücksetzen	de
training.date.valid	gültig bis	de
no_harmonized_activities_mapped_at_the_moment	Keine Harmonized AktivitÃ¤ten im Moment zugeordnet.	de
n.a	N.v.	de
no_functional_activities_mapped_at_the_moment	Keine Funktionelle AktivitÃ¤ten im Moment zugeordnet.	de
employee.name	Name des Mitarbeiters:	de
site_pdf	Site:	de
department_pdf	Abteilung:	de
designation_pdf	Bezeichnung:	de
list_of_harmonized_SOP	Liste der harmonisierten SOP	de
list_of_functional_SOP	Liste der Functional SOP	de
french	FranzÃ¶sisch	de
german	Deutsch	de
english	Englisch	de
site_1	Site:	de
list_of_employees	Liste der Mitarbeiter	de
pending	Schwebend	de
cleared	GelÃ¶scht	de
pie_chart	Kreisdiagramm	de
training_status	Training-Status	de
bar_chart	Bar Chart	de
no_of_employees	Anzahl Mitarbeiter	de
pending_tni_trainings	Bis TNI Trainings	de
pending_SOP_trainings	Bis SOP Trainings	de
Site:	: [Harmonized]	de
list_of_SOPs	Liste der SOPs	de
RT	(RT)	de
functional_JR	Functional JR	de
this_is_your_last_attempt	Dies ist Ihre letzte Versuch.	de
message	Nachricht	de
do_you_want_to_sumbit_your_test	Wollen Sie Ihren Test fÃ¼llen?	de
confirm_dialog	BestÃ¤tigen Dialog	de
q_	Q.	de
set_regeneraion_year	Set Regeneration Year	en
set_regeneraion_year	Satz Erneuerung Jahr	de
training_start_date_interval	Training Start Date Interval	en
test_can_not_be_generated_your_blocked_test_has_not_been_approved_please_contact_to_head	Test kann nicht erzeugt werden. Ihre Blockierte-Test noch nicht genehmigt wurde. Bitte kontaktieren Sie Ihren Abteilungsleiter.	de
test_can_not_be_generated_you_have_already_attempted_3_times_please_contact_to_your_department_head	Test kann nicht erzeugt werden. Sie haben bereits 3 mal versucht. Bitte kontaktieren Sie Ihren Abteilungsleiter.	de
training_generated	Ausbildung Generated	de
wrong_file_format_please_select_excel_file	Falsches Dateiformat. Bitte wÃ¤hlen Sie Excel-Datei.	de
the_SOP_is_mapped_at	Die SOP wird bei abgebildet:	de
tni_sub_category	TNI Sub-Kategorie:	de
location:	Location:	de
updated	Aktualisiert	de
site_phone	SitePhone:	de
site_pincode	SitePincode:	de
site_address	SiteAddress:	de
site_city	SiteCity:	de
site_state	SiteState:	de
site_country	SiteCountry:	de
site_fax	SiteFax:	de
site_status	SiteStatus:	de
in.active	inaktiv	de
compulsory_	[Verbindliche]	de
created	Erstellt	de
email_	E-Mail:	de
trainer_organization_updated	Trainer Organisation aktualisiert	de
trainer_designation_updated	Trainer Bezeichnung aktualisiert	de
trainer_experience_updated	Trainer Erfahrungen angepasst	de
attandance_for	Messeteilnahme fÃ¼r:	de
created.	Â erstellt.	de
between	zwischen	de
and	und	de
to	Â - Zu -	de
To	Â Auf	de
list_of_presentations	Liste der PrÃ¤sentationen	de
all_departments	Alle Bereiche	de
all_levels	Alle Levels	de
report_pdf	Report.pdf	de
application_pdf	application / pdf	de
logged_in	angemeldet	de
training_id	Ausbildung Id.	de
rsr.employee.dashboard	Mitarbeiter Übersicht	de
rsr.attendanc	Teilnahme	de
rsr.employee.transfer	Employee Transfer	de
rsr.document.upload	Dokument hochladen	de
rsr.employe.based.jr	Employe Based JR	de
rsr.employee	Mitarbeiter	de
rsr.my.jrs	Meine JRs	de
rsr.my.tnis	Meine tnis	de
rsr.notice	bemerken	de
rsr.permissions	Berechtigungen	de
rsr.presentation.test	Presentation-Test	de
rsr.presentation.test.details	Presentation Test Details	de
rsr.presentation Upload	Präsentation hochladen	de
rsr.test	Test	de
rsr.test.details	Test Details	de
rsr.trainer	Trainer	de
rsr.tnicategory	TNICategory	de
rsr.tniSubCategory	TNISubCategory	de
rsr.designation.group	Bezeichnung Gruppe	de
rsr.permission.tabs	Permission Tabs	de
rsr.SOP.category	SOP Kategorie	de
rsr.view.SOP.doc	Ansicht SOP Doc	de
rsr.head.dashboard	Leiter Übersicht	de
rsr.hr.training	HR Training	de
rsr.view.tni.doc	Ansicht TNI Doc	de
rsr.sop.sheet.upload	SOP Blatt hochladen	de
rsr.view.jr	Ansicht JR	de
rsr.view.presentations	anzeigen von Präsentationen	de
rsr.training	Training	de
rsr.site	Standort	de
rsr.approvals	Zulassungen	de
rsr.assign.jr	Weisen JR	de
rsr.assign.tni	Weisen TNI	de
rsr.department	Abteilung	de
error_occured	Fehler aufgetreten!	de
training_date	Training Datum	de
uploaded_file	Hochgeladene Datei	de
start_test	Test starten	de
incorrect_answers	falsche Antworten	de
desg_	DESG	de
error.msg.value.text	Bitte geben Sie einen Text-Wert.	de
trainer_id	Close	en
rsr.designation	Designation	en
rsr.designation	Bezeichnung	de
login	Login	en
trainer_name	Trainer Name	de
harmonized_	:[Harmonized]	en
harmonized_	:[Harmonized]	de
msg.error	Error!	de
please_select_language	Language	en
please_select_language	Add Sprache	de
please_select_site_to_login	Select Site	en
please_select_site_to_login	wählen Standort	de
command.create	Standort	de
site_name	Standort Name	de
audit_category	Audit Category	en
audit_category	Prüfung Kategorie	de
log_id	Log Id	en
log_id	Anmelden die	de
user	user	en
user	Benutzer	de
date_time	Date-Time	en
date_time	Datum-Zeit	de
details	Details	en
details	Beiwerk	de
valid_till_date_(in_months)	Valid Till Date (in Months)	en
valid_till_date_(in_months)	gültig bis Datum (in Monaten)	de
next_review_date_(in_months)	Next Review Date(in months)	en
next_review_date_(in_months)	nächste Überprüfung Datum (in Monaten)	de
no_of_questions	No Of Questions	en
no_of_questions	Nr.von Frage	de
no_of_option	No Of Options	en
no_of_option	Nr.von Options	de
min_passing_percentage	Min Passing Percentage	en
min_passing_percentage	Minimum Weitergabe Prozentsatz	de
max_attempts	Max Attempts	en
max_attempts	Maximum Versuche	de
set_month	Set Month	en
set_month	Satz Monat	de
send_mail_to_when_sop_expired	Send Mail to When SOP Expired	en
manual_upload	Manual Upload	en
send_mail_to_when_sop_expired	senden Post zu wenn SOP abgelaufen	de
training_start_date_interval	Ausbildung Anfang Datum Intervall	de
set_trainer_expiration_interval_(in_years)	Set Trainer Expiration Interval (In Years)	en
set_trainer_expiration_interval_(in_years)	Satz Ausbilder Ablauf Intervall (in Jahre)	de
send_approval_to	Send Approval To	en
send_approval_to	senden Genehmigung zu	de
password_validity_in_days	Password Validity in Days	en
password_validity_in_days	Passwort Gültigkeit in Tage	de
mailscheduled_day	MailScheduled Day	en
mailscheduled_day	Post geplant Tag	de
mail_scheduled_day_before_effective_date	Mail Scheduled Day Before Effective Date	en
mail_scheduled_day_before_effective_date	Post geplant Tage vor wirksam Datum	de
weekly_mail	Weekly Mail Schedule Day(0=sunday to 6=saturday)	en
weekly_mail	Wochen Post geplant Tag(0=Sonntag zu 6=Samstag)	de
email_hostname	Email Hostname	en
email_hostname	Email Hostname	de
email_port	Email Port	en
email_port	Email Port	de
email_id	Email Id	en
email_id	Email Identifikation	de
email_password	Email Password	en
email_password	Email Passwort	de
emp_id	Employee Id	en
emp_id	Mitarbeiter Identifikation	de
emp_name	Employee Name	en
emp_name	Mitarbeiter Namen	de
dept_name	Department Name	en
dept_name	Abteilung Namen	de
activate	Activate	en
activate	aktivieren	de
deactivate	Deactivate	en
deactivate	deaktivieren	de
activate_desig	Activate Desig	en
activate_desig	aktivieren Bezeichnung	de
deactivate_desig	Deactivate Desig	en
deactivate_desig	deaktivieren Bezeichnung	de
deactivate_emp	Deactivate Emp	en
deactivate_emp	deaktivieren Mitarbeiter	de
designation_mapped_depat	Designations mapped to the department	en
designation_mapped_depat	Bezeichnung abgebildet zu die Abteilung	de
emp_working_dept	Employees working under the department	en
emp_working_dept	Mitarbeiter Arbeit unter die Abteilung	de
deact_selected_emps	Deactivate Selected Employees	en
deact_selected_emps	deaktivieren ausgewählt Mitarbeiter	de
active_depts	Active departments	en
active_depts	aktivieren Abteilung	de
system_user	System Users	en
system_user	System Benutzer	de
module_to_map	Modules To Map	en
module_to_map	Modules zu Karte	de
faxNumber	Fax Number	en
faxNumber	Fax Anzahl	de
select_module	Select Modules	en
select_module	wählen Module	de
tab_permission	Tab Permissions	en
tab_permission	Tab Berechtigungen	de
upload_picture	Upload Picture	en
upload_picture	laden Bild	de
assign_roles	Assign Roles	en
assign_roles	zuweisen Rollen	de
training_manager	Training Manager	en
training_manager	Ausbildung Manager	de
in_active	In Active	en
in_active	In aktiv	de
reporting_manager	Reporting Manager	en
reporting_manager	Berichterstattung Manager	de
update	Update	en
update	Aktualisierung	de
select_language	Select Language	en
select_language	wählen Sprache	de
key	Key	en
key	Schlüssel	de
value	Value	en
value	Wert	de
provide_path_for_sop	Provide Path for Sops	en
provide_path_for_sop	bieten Weg für SOPS	de
status_graph	Status Graph	en
status_graph	Status Graph	de
blocked_test	Blocked Test	en
blocked_test	verstopft Test	de
job_description	Job Description	en
job_description	Job Beschreibung	de
export_to_excel	Export to Excel	en
export_to_excel	Export zu übertreffen	de
sop_status	SOP Status	en
sop_status	SOP Status	de
deviated_training	Deviated Trainings	en
deviated_training	Deviated Schulungen	de
deviated_id	Deviated Id	en
deviated_id	Abweichung Identifikation	de
closed_extend	Deviated Id	en
closed_extend	geschlossen/Erweiterte	de
reporting_to	Reporting To	en
reporting_to	Berichterstattung zu	de
received_by	Received By	en
received_by	Received von	de
authorised_by	Authorized by	en
authorised_by	zugelassen von	de
signature	Signature	en
signature	Unterschrift	de
mapping_wise	Mapping Wise	en
mapping_wise	Mapping Wise	de
sop_wise	SOP Wise	en
sop_wise	SOP Wise	de
based_on	Based on	en
based_on	basierend auf	de
search_based_on	Search Based on	en
search_based_on	Search Based on	de
date_duration	Date Duration	en
date_duration	Datum Dauer	de
version	Version	en
version	Version	de
presentation_upload	Presentation Upload	en
presentation_upload	Darstellung laden	de
upload_mode=	Upload Mode	en
upload_mode	laden Modus	de
upload_mode	Upload Mode	en
manual_upload	Handbuch laden	de
sheet_upload	Sheet Upload	en
sheet_upload	Blatt laden	de
file_directory_path	File Directory Path	en
file_directory_path	Datei Verzeichnis Weg	de
upload	Upload	en
upload	laden	de
correct_questions	Correct Questions	en
correct_questions	richtig Fragen	de
jr_mappings	JR Mappings	en
jr_mappings	JR Mappings	de
SOP_media_upload	SOP Media Upload	en
SOP_media_upload	SOP Medien laden	de
add_remove_media	Add/Remove Media	en
add_remove_media	hinzufügen/entfernen Medien	de
trainer_type	Trainer Type	en
trainer_type	TrainerTyp	de
organization_and_designation	Organization and Designation	en
organization_and_designation	Organisation und Bezeichnung	de
phone_and_email	Phone and E-mail	en
phone_and_email	Telefon und E-Mail	de
sop_category	SOP-Category	en
sop_category	SOP-Kategorie	de
head(department/site)	Head (Abteilung / Standort)	de
select_training	aussuchen Sie Training	de
assign_jr	Assign JR	en
assign_jr	zuweisen JR	de
site_id	Site Id	en
site_id	Standort Identifikation	de
emp_based_jr	Employee Based JR	en
emp_based_jr	Mitarbeiter basierend JR	de
view_sop_tni	View SOP/TNI	en
view_sop_tni	anzeigen SOP/TNI	de
sop_trainings_pending	SOP Schulungen anstehend	de
tab_employee	Employee	en
tab_employee	Mitarbeiter	de
tab_site	Site	en
tab_site	Standort	de
tab_department	Department	en
tab_department	Abteilung	de
tab_permissions	Permission	en
tab_permissions	Berechtigungen	de
tab_test	Test	en
tab_test	Test	de
tab_hod	HOD	en
tab_hod	HOD	de
tab_assignment	Assignment	en
tab_assignment	Zuordnung	de
tab_view_documents	View Documents	en
tab_view_documents	anzeigen Unterlagen	de
tab_trainer	Trainer	en
tab_trainer	Trainer	de
tab_training	Training	en
tab_training	Ausbildung	de
tab_skill_matrix	Skill Matrix	en
tab_skill_matrix	Geschicklichkeit Matrix	de
tab_sheet_upload	Sheet Upload	en
tab_sheet_upload	Blatt laden	de
tab_multilingual_screen	Multilingual Screen	en
tab_multilingual_screen	mehrsprachig Bildschirm	de
tab_training_manger_status	Training Manager Status	en
tab_training_manger_status	Ausbildung Krippe Status	de
browse_file	blättern Datei	de
responsibilities	Responsibilities	en
responsibilities	Aufgaben	de
select_client	Test	en
select_client	wählen Auftraggeber	de
forgot_pwd_qustn	Forgot Password Questions	en
forgot_pwd_qustn	vergessen Passwort Fragen	de
fix_jrs	Fix JRs	en
fix_jrs	fixieren JRs	de
insert_extended_date	Insert Extended Date :	en
insert_extended_date	einfügen Erweiterte Datum :	de
tni_upcoming_training	TNI Upcoming Training	en
tni_upcoming_training	TNI bevorstehende Ausbildung	de
b	Fragen müssen gestellt werden!	de
a	Atleast	en
a	Atleast	de
c	Please provide atleast	en
c	Bitte geben atleast	de
d	options.	en
d	Optionen.	de
firstname	First Name	en
add_role	Add Role	en
add_role	hinzufügen Rolle	de
upload_tni	Upload Document	en
upload_tni	laden Dokument	de
select_jr	Select JRs	en
select_jr	wählen JRs	de
please_insert_presentation_name	Please enter presentation name.	en
please_insert_presentation_name	Bitte eingeben Präsentation name.	de
login_Error_please_enter_valid_username_and_password_along_with_your_site	Einloggen Fehler: Bitte geben gilt Benutzernamen und Passwort zusammen mit Ihrer Website	de
pincode	PIN-Code	de
pincode	Pincode	en
country	Land	de
country	Country	en
designation_trainer	Trainer Bezeichnung	de
tab_designation_group	Bands	de
Admin Configuration	Admin Configuration	en
Induction training	Induktion Ausbildung	de
Approval	Approval	en
Designation Mapping	Designation Mapping	en
Admin Configuration	Admin Konfiguration	de
Active Inactive	Active Inactive	en
Active Inactive	aktiv inaktiv	de
Audit	Audit	en
Audit	Prüfung	de
Module Registration	Module Registration	en
Approval	Genehmigung	de
induction_training_mapping	Create Induction Training	en
induction_training_mapping	Neues Induktions Ausbildung	de
induction_training	Upload Induction Training	en
induction_training	laden Induktion Ausbildung	de
deviation	Waive-off	en
deviation	Verzichten-off	de
experience_trainer	Trainer Experience	en
experience_trainer	Trainer Erfahrung	de
upcoming_training	Upcoming Training	en
upcoming_training	bevorstehende Ausbildung	de
attended_training	Attended Training	en
attended_training	besucht Ausbildung	de
selected_document_view	Selected Document To View	en
selected_document_view	ausgewählt Dokument zu Blick	de
no_of_options	No Of Options	en
no_of_options	Nein. von Option	de
your_account_has_been_blocked_pls_login_after_mins	Ihre Konto hat gewesen verstopft Bitte Anmelden nach 30 Protokoll.	de
your_account_has_been_blocked_pls_login_after_mins	Your account has been blocked. Please Login After 30 Minutes.	en
training.type.on_job_training	auf Job Ausbildung	de
training.after.effictive.date.comment	Comment	en
training.after.effictive.date.comment	Kommentar	de
employe_mapping	Employee Mapping	en
employe_mapping	Mitarbeiter Mapping	de
tab_upload_employee_details	Laden Sie MitarbeiterInformationen	de
tab_upload_employee_details	Upload Employee Details	en
designation_trainer	Trainer Designation	en
user_has_been_created_successful_password_has_been_sent_to_registered_email_address	User has been created successfully password has been send to registered email address.	en
user_has_been_created_successful_password_has_been_sent_to_registered_email_address	Benutzer hat gewesen erstellt erfolgreich Passwort hat gewesen has_been_created_successful_password_has_been_sent_to_registered_email_address gesendet zu registriert E-Mail- Adresse.	de
please_save_password	Please save the password :	en
please_save_password	Bitte sparen die Passwort :	de
error_while_creating_employee	Error while creating Employee!	en
error_while_creating_employee	Fehler während Erstellen Mitarbeiter!	de
please_provide_future_date	geben Sie bitte kunftigen Zeitpunkt	de
please_provide_future_date	Please Provide Future Date	en
test_can_not_be_generated_contact_to_your_department_head	Test can not be generated. Your Blocked Test Has Not Been Approved. Please contact to your Department Head.	en
test_can_not_be_generated_contact_to_your_department_head	Test kann nicht erzeugt werden. Ihre Blocked-Test wurde nicht zugelassen. Bitte wenden Sie sich an Ihren Abteilungsleiter.	de
please_provide_mapping_for_sop	Bitte geben Sie Mapping für SOP	de
please_provide_mapping_for_sop	Please provide mapping for SOP	en
presentation_name	Presentaion Name	en
presentation_name	Präsentation Name	de
please_provide_valid_password	Please provide valid password.	en
please_provide_valid_password	Bitte bieten gültig Passwort,	de
please_provide_valid_password_not_last_3	Please provide valid password not last 3 password.	en
please_provide_valid_password_not_last_3	 Bitte bieten gültig Passwort nicht letzte  3 passwort.	de
please_provide_username	Please provide username.	en
please_provide_username	Bitte bieten Benutzernamen,	de
please_provide_password	Please provide password.	en
please_provide_password	Bitte bieten passwort,	de
chanage_password	change Password	en
chanage_password	Veränderung passwort	de
confirm_password	Confirm Password	en
confirm_password	bestätigen Passwort	de
tab_emp_role_mapping	EmployeRoleMapping	en
tab_emp_role_mapping	MitarbeiterRolleMapping	de
emp_role_mapping	Emp Role Mapping	en
emp_role_mapping	Mitarbeiter Rolle Mapping	de
provide_path_details_for_emp	Provide Path for Employee Details	en
provide_path_details_for_emp	Geben Sie Pfad für Mitarbeiterdaten	de
uploaded_emp	Uploaded Employees	en
uploaded_emp	hochgeladen Mitarbeiter	de
view_trainer_by_topic	View Trainer By Topic	en
view_trainer_by_topic	Trainer Motiv anzeigen	de
regulatory_training	Regulatory Training	en
regulatory_training	Regulatory Ausbildung	de
dept_training_coordinator	Department Training Coordinator	en
dept_training_coordinator	 Abteilung Training Coordinator	de
emp_signature	Employee Signature	en
emp_signature	 Unterschrift des Arbeitnehmers	de
head_signature	Head Signature	en
head_signature	Leiter Unterschrift	de
functional_name	Funktions Name	de
functional_code	Funktions Code	de
functional_description	Funktions Beschreibung	de
upload_inductiona_training	Upload Inductiona Training	en
upload_inductiona_training	Einarbeitung Galerie	de
tab_uplolad_induction	Upload Induction	en
send_for_employee_aceptense	Send For Employee Acceptance	en
send_for_employee_aceptense	Senden Für Mitarbeiter Acceptance	de
sent_from	Sent From	en
sent_from	gesendet von	de
type_of_approval	Type Of Approval	en
type_of_approval	 Art der Zulassung	de
tab_emp_sop_mapping	Employee SOP Mapping	en
tab_emp_sop_mapping	Mitarbeiter SOP Mapping	de
Function Mapping	Function Mapping	en
functional_code	Function Code	en
View Mapping	View Mapping	en
functional_name	Function Name	en
tab_uplolad_induction	hochladen Induktions	de
Function Mapping	Mapping-Funktion	de
Employee Upload	Employee Upload	en
Employee Upload	 Mitarbeiter hochladen	de
Function	Function	en
Function	Funktion	de
functional_description	Function Description	en
Induction training	Induction Training	en
QA_training	QA Systems	en
QA_training	QA Systeme	de
score	Partitur %	de
score	Score %	en
tab_designation_group	Bands	en
add_option	Add Options	en
add_option	Optionen hinzufügen	de
tab_emp_regulatory	Mandatory Training	en
tab_emp_regulatory	Mandatory Ausbildung	de
tab_upload_induction	Upload Induction	en
tab_upload_induction	hochladen Induktions	de
Designation Mapping	Bezeichnung Mappping	de
Bands	Bands	en
Bands	Bands	de
Module Registration	Modul-Anmeldung	de
Department Head	Department Head	en
Class Room Training	Class Room Training	en
Class Room Training	Class Room Training	de
My Job Description	My Job Description	en
My Job Description	Mein Jobbeschreibung	de
Mandatory Training	Mandatory Training	en
Mandatory Training	Regulatory Training	de
View Mapping	View Mapping	de
Final SOP Upload	Final SOP Upload	en
Final SOP Upload	Abschluss SOP hochladen	de
Permissions	Permissions	en
Permissions	Permissions	de
Employee	Employee	en
Employee	Mitarbeiter	de
Department	Department	en
Department	Abteilung	de
Training	Training	en
Training	Ausbildung	de
Trainer	Trainer	en
Trainer	Trainer	de
Adhoc Training Topic	Adhoc Training Topic	en
Adhoc Training Topic	Adhoc Thema Ausbildung	de
Adhoc Training	Adhoc Training	en
Adhoc Training	adhoc Ausbildung	de
Create Trainer	Create Trainer	en
Create Trainer	Create Trainer	de
please_confirm_the_password	Please provide confirm password.	en
passwords_do_not_match	New and confirm password are does not match!	en
dtc	Department Training Coordinator	en
reporting_manager_name	Reporting Manager Name	en
srno	Sr No.	en
JD_view_by_version	JD View By Version	en
JD_approval	JD Approval	en
JD_creation	JD Creation	en
accepted_by	Accepted by	en
approved_by	Approved by	en
job_description_status	Job Description Status	en
approved	Approved	en
under_approval_pending	Under Approval Pending	en
created_date	Created Date	en
created_by	Created By	en
latest_version	Latest Version	en
comment	Comment	en
My Training	My Training	en
My Training	My Training	de
Designation Category	Designation Category	en
change_mapping	Change Function Mapping	en
SOP Management	SOP Management	en
SOP_Upload	SOP Upload	en
Head of Department	Head of Department	en
Head of Department	Head of Department	de
upload_induction	Upload Induction	en
Inactivate	Inactivate	en
Report	Report	en
Employee Status	Employee Status	en
Employee Status	Employee Status	de
training_allowance	Training Allowance Period for In-Effect SOPs	en
training_allowance	Training Allowance Period for In-Effect SOPs	de
Department Mapping	Department Mapping	de
Department Mapping	Department Mapping	en
Equipments	Ausstattung	de
Equipments	Equipments	en
Callibration Schedule	Callibration Schedule	en
Callibration Schedule	Callibration Spielplan	de
PM Schedule	PM Schedule	en
PM Schedule	PM Zeitplan	de
Validation Schedule	Validation Schedule	en
Validation Schedule	Validierungsplan	de
Schedule Approval	Schedule Approval	en
Schedule Approval	Spielplan Genehmigung	de
Function Code Creation	Function Code Creation	en
Function Code Creation	Function Code Creation	de
User Report	User Report	en
User Report	Nutzer Bericht	de
Monthly Reports	Monthly Reports	en
Monthly Reports	Monthly Reports	de
Yearly Reports	Yearly Reports	en
Yearly Reports	Yearly Reports	de
View Schedules	View Schedules	en
View Schedules	View Schedules	de
Instruments Calibration Matrix	Instruments Calibration Matrix	en
Instruments Calibration Matrix	Instruments Calibration Matrix	de
Employee Details	Employee Details	en
Employee Details	Employee Details	de
Roles & Permissions	Roles & Permissions	en
Roles & Permissions	Roles & Permissions	de
Module Registration & Roles	Module Registration & Roles	en
Module Registration & Roles	Module Registration & Roles	de
site_has_been_created_successfully	Site has been created successfully.	en
name_of_the_employee	Nom de l'employé	fr
reporting_to_whom	Reporting to whom	en
reporting_to_whom	Berichterstattung an die	de
reporting_to_whom	Relevant que	fr
job_responsibility_heading	JOB RESPONSIBILITY	en
job_responsibility_heading	JOB VERANTWORTUNG	de
job_responsibility_heading	JOB RESPONSABILITÉ	fr
job_responsibility	Job Responsibility	en
job_responsibility	Job Verantwortung	de
job_responsibility	Responsabilité d'emploi	fr
educational_qualification	Educational Qualification	en
educational_qualification	Educational Qualifikation	de
educational_qualification	Qualification pour l'éducation	fr
finalized_by	Finalized By	en
finalized_by	Durch abgeschlossen	de
finalized_by	finalisé par	fr
job_description_version_no	Job Description Version No:	en
job_description_version_no	Stellenbeschreibung Versionsnummer:	de
job_description_version_no	Description du poste numéro de version:	fr
please_upload_job_description	Please Upload Job Description	en
please_upload_job_description	Bitte Galerie Job Description	de
please_upload_job_description	Se il vous plaît Upload Description du poste	fr
pdf	PDF	en
pdf	PDF	de
pdf	PDF	fr
sop_status	Statut SOP	fr
phone	téléphone	fr
no_record_available	Aucun enregistrement disponible	fr
no_of_employees	Nombre d'employés	fr
state	état	fr
bar_chart	Graphique à barres	fr
faxNumber	Numéro de fax\n	fr
pending	en attendant	fr
cleared	effacé	fr
country	pays	fr
pincode	code PIN	fr
pie_chart	Pie graphique	fr
employee_list_cleared_training	Liste des employés (formation Effacé)	fr
employee_list_pending_training	Liste des employés (formation en attente)	fr
status	statut	fr
mails_sent	mails envoyé 	fr
status.active	actif	fr
last_mail_sent	Dernière dépêche envoyée	fr
send_email	Envoyer un email	fr
select_search_criteria	Select search criteria	en
select_search_criteria	Suchkriterien auswählen	de
select_search_criteria	Sélectionnez les critères de recherche	fr
status.inactive	Inactif	fr
employee	employé	fr
waived_off	Waived-off	en
waived_off	Verzichtet-off	de
waived_off	Renoncé-off	fr
enter_ref. doc. no.	Entrez Réf. Doc. Non.	fr
please_enter_ref_doc_no	Please enter Ref. Doc. No.	en
please_enter_ref_doc_no	Bitte geben Sie Ref. Dok. Nein.	de
please_enter_ref_doc_no	Se il vous plaît entrer Réf. Doc. Non.	fr
no_ref_doc_no_found	No Ref. Doc. No. found.	en
no_ref_doc_no_found	Nein Ref. Dok. Nr gefunden	de
no_ref_doc_no_found	N Ref. Doc. Non trouvé	fr
please_select_ref_doc_no	Please Select Ref. Doc. No.	en
please_select_ref_doc_no	Bitte wählen Ref. Dok. Nein.	de
please_select_ref_doc_no	Se il vous plaît Sélectionnez Réf. Doc. Non.	fr
no_pending_trainings_found	No Pending Trainings Found.	en
no_pending_trainings_found	Kein Pending Trainings gefunden	de
no_pending_trainings_found	Aucune attente Formations Trouvé	fr
no_Waived_off_training_found	No Waived-off Training found.	en
no_Waived_off_training_found	Kein Verzichtet-off Ausbildung gefunden	de
no_Waived_off_training_found	Aucune formation renoncé-off trouvé	fr
training_waive_off_succesfully	Training waive-off succesfully.	en
training_waive_off_succesfully	Ausbildung verzichten-off erfolgreich	de
training_waive_off_succesfully	Formation renonce-off avec succès	fr
no_trainings_found_for_waive_off	No trainings found for waive-off.	en
no_trainings_found_for_waive_off	Keine Schulungen für verzichten off gefunden	de
no_trainings_found_for_waive_off	Pas de formations trouvés pour renoncer au large	fr
employee_waive_off_training	Employee waive-off training	en
employee_waive_off_training	Mitarbeiter verzichten einmalige Ausbildung	de
employee_waive_off_training	La formation renoncer employé-off	fr
excel	Excel	en
excel	Excel	de
excel	Excel	fr
unblocked	Unblocked	en
unblocked	entsperrt	de
unblocked	débloqué	fr
update 	mettre à jour	fr
training_id	formation Id	fr
unblocked_by	Unblocked by	en
unblocked_by	von entsperrt	de
unblocked_by	débloquée par	fr
dept_does_not_exist	Département ne existe pas	fr
no_unblocked_training_found	No unblocked training found.	en
no_unblocked_training_found	Kein freigegeben Ausbildung gefunden	de
no_unblocked_training_found	Aucune formation débloqué trouvé	fr
command.save	Enregistrer\n	fr
no_blocked_test_found	Aucun test trouvé bloqués	fr
select_training_type	Select Training Type	en
select_training_type	Wählen Training Art	de
select_training_type	Sélectionner le type de formation	fr
adhoc	Adhoc	en
adhoc	Ad Hoc	de
adhoc	Ad Hoc	fr
search_employee	Search Employee	en
search_employee	Suche Mitarbeiter	de
search_employee	Recherche employé	fr
adhoc_training_topic	Adhoc Training Topic	en
adhoc_training_topic	Adhoc Trainings Thema	de
adhoc_training_topic	Adhoc Sujet formation	fr
command.reset	remettre	fr
trainers	formateurs	fr
generate	Generate	en
generate	generieren	de
generate	générer	fr
generate_certificate	Generate Certificate	en
generate_certificate	Zertifikat erzeugen	de
generate_certificate	générer certificat	fr
site_edit	Edit	en
site_edit	bearbeiten	de
site_edit	éditer	fr
site_short_name	Baustelle Kurzname 	de
no_site_found	No Site found	en
no_site_found	Kein Baustelle gefunden 	de
no_site_found	Aucun site trouvé 	fr
please_select_sop	Please select SOP.	en
please_select_sop	Bitte wählen SOP	de
please_select_sop	Se il vous plaît sélectionnez SOP	fr
"please_select_trainer	Please select Trainer.	en
"training_certificate	Training Certificate	en
is_awarded_to	IS AWARDED TO	en
is_awarded_to	Vergeben	de
is_awarded_to	Est attribué à	fr
for_participation_in_the_training_program_on	FOR PARTICIPATION IN THE TRAINING PROGRAM ON	en
for_participation_in_the_training_program_on	ZUR TEILNAHME AN DER AUSBILDUNGSPROGRAMM AUF	de
for_participation_in_the_training_program_on	POUR LA PARTICIPATION DANS LE PROGRAMME DE FORMATION SUR	fr
conducted_on	CONDUCTED ON	en
conducted_on	GEFÜHRT ON	de
conducted_on	ESSAIS SUR	fr
certified_by	CERTIFIED BY	en
certified_by	zertifiziert durch	de
certified_by	CERTIFIE PAR	fr
trainer_name	TRAINER NOM	fr
please_select_adhoc_training_topic	Please select adhoc training topic.	en
please_select_adhoc_training_topic	Bitte wählen adhoc Trainings Thema	de
please_select_adhoc_training_topic	Se il vous plaît sélectionnez thème de la formation ad hoc	fr
first_complete_all_training_and_then_after_generate_certificate	First complete all training and then after generate certificate	en
first_complete_all_training_and_then_after_generate_certificate	Zuerst füllen Sie alle Schulungen und als nach generieren Zertifikat	de
first_complete_all_training_and_then_after_generate_certificate	Première compléter toute la formation et qu'après générer certificat	fr
report	Bericht	de
report	rapport	fr
training_log	Training Log	en
training_log	Trainingstagebuch	de
training_log	formation Connexion	fr
pending_training	Pending Training	en
pending_training	Schwebende Ausbildung	de
pending_training	formation attente	fr
report_by_role	Report By Role	en
report_by_role	Bericht Nach Rolle	de
report_by_role	Rapport Par Rôle	fr
effective_sop_report	Effective SOP Report	en
effective_sop_report	Effektive SOP Bericht	de
effective_sop_report	Rapport SOP efficace	fr
all_training	All Training	en
alle Schulungen	Effektive SOP Bericht	de
Toutes les formations	Rapport SOP efficace	fr
all_training	alle Schulungen	de
all_training	Toutes les formations	fr
sub_function	Sub Function	en
sub_function	Unterfunktion	de
sub_function	sous Fonction	fr
completed_trainings	Completed Trainings	en
completed_trainings	Abgeschlossene Schulungen	de
completed_trainings	Formations Terminé	fr
date_of_training	Date of Training	en
date_of_training	Tag der Ausbildung	de
date_of_training	Date de formation	fr
trainer_name_report	Trainer Name	en
trainer_name_report	Trainer-Name	de
trainer_name_report	Nom formateur	fr
result	RESULT	en
result	ERGEBNIS	de
result	RÉSULTAT	fr
%_obtained	% Obtained	en
%_obtained	% erhalten	de
%_obtained	Obtenu%	fr
to_do_trainings	To-Do Trainings	en
to_do_trainings	Um Trainings tun	de
to_do_trainings	To Do Formations	fr
please_specify_the_name_of_site	Se il vous plaît spécifier le nom du site	fr
no_details_found_for_selected_employee	No Details Found for selected employee.	en
cleared_trainings	Formations défrichées	fr
select_department_code	Select Department code.	en
select_department_code	Wählen Abteilung Code	de
select_department_code	Sélectionnez le code Département	fr
category	catégorie	fr
view_document	View Document	en
view_document	Dokument anzeigen	de
view_document	Voir document	fr
printed_by	Printed By	en
printed_by	gedruckt durch	de
printed_by	imprimé par	fr
ref_doc_no_not_found	Ref. Doc. No. not found.	en
ref_doc_no_not_found	Ref. Dok. Nr nicht gefunden	de
ref_doc_no_not_found	Ref. Doc. N ° introuvable	fr
training_attendance	TRAINING ATTENDANCE	en
training_attendance	TRAINING TEILNAHME	de
training_attendance	FORMATION PARTICIPATION	fr
trainer_signature	Trainer Signature	en
trainer_signature	Trainer Unterschrift	de
trainer_signature	entraîneur Signature	fr
please_select_department_name.	Please select department Name.	en
please_select_department_name	Bitte wählen Sie Abteilung Name	de
please_select_department_name	Se il vous plaît sélectionnez Nom du ministère	fr
sop_pending_employees_report.	Sop Pending Employees Report	en
sop_pending_employees_report	Sop Pending Mitarbeiter Bericht	de
sop_pending_employees_report	Sop attente Rapport employés	fr
sop_name_header	SOP NAME	en
sop_name_header	SOP Name	de
sop_name_header	NOM SOP	fr
emp_id_header	EMPLOYEE ID	en
emp_id_header	Mitarbeiter-ID	de
emp_id_header	EMPLOYÉ ID	fr
emp_name_header	EMPLOYEE NAME	en
emp_name_header	Name des Mitarbeiters	de
emp_name_header	NOM DE L'EMPLOYÉ	fr
department_header	DEPARTMENT	en
department_header	Abteilung	de
department_header	département	fr
designation_header	DESIGNATION	en
designation_header	BEZEICHNUNG	de
designation_header	DÉSIGNATION	fr
no_data_found_for_selected_department	No Data Found For Selected Department.	en
no_data_found_for_selected_department	Keine Daten gefunden für ausgewählte Abteilung	de
no_data_found_for_selected_department	Aucune donnée trouvée Pour Département Sélectionné	fr
employee_by_role	Employee By Role	en
employee_by_role	Mitarbeiter Nach Rolle	de
employee_by_role	Employé Par Rôle	fr
scheduler_mail_scheduled_day_before_effective_date	Mail Scheduled Day Before Effective Date	en
scheduler_mail_scheduled_day_before_effective_date	Post geplant Tage vor wirksam Datum	de
cams_password_validity_in_days	Password Validity in Days	en
cams_password_validity_in_days	Passwort Gültigkeit in Tage	de
sop_training_allowance_period	Training Allowance Period for In-Effect SOPs	en
sop_training_allowance_period	Training Allowance Period for In-Effect SOPs	de
wfcm_hr_dept_id	Select your company's HR department	en
activate	Activer	fr
wfcm_pending_induction_other_email_ids	Other email address	en
wfcm_adhoc_rpt_mgr_in_emp_screen	Adhoc Reporting Manager In Employee Screen	en
wfcm_adhoc_trng_mgr_in_emp_screen	Adhoc Training Manager In Employee Screen	en
wfcm_induction_pending_blocked_days	Induction Pending Blocked Days	en
wfcm_induction_pending_intimation_days	Induction Pending Intimation Days	en
scheduler_password_reset_days	Password Validity in Days	en
sop_training_certificate	Training Certificate	en
sop_valid_till_date	SOP Valid Till Date	en
sop_reamind_month	SOP Expiry Reminder Month (Should Be Less Than Valid Till Date (in Months))	en
sop_send_mail_to_before_sop_expired_email	Send mail to Before SOP is expired	en
sop_is_trainer_cert_required	Trainer Certificate Required	en
task_critical_priority_days	Task Critical Priority(in Days)	en
cams_port	Server Port	en
cams_ip	Server IP	en
task_high_priority_days	Task High Priority Days	en
task_normal_priority_days	Task Normal Priority Days	en
task_low_priority_days	Task Low Priority Days	en
task_auto_close_days	Task Auto Close Days	en
arms_file_sys	File System Location	en
comparison_temp_dir	Temporary Directory	en
comparison_command	Command	en
comparison_path_separator	Path Separator	en
comparison_option	Command Option	en
click_to_edit	Click To Edit	en
sop_no_of_question_display	No. Of Questions Display (Should Be Less Than No Of Questions)	en
first_you_have_to_inactivate_all_mapped_departments_details	First you have to inactivate all mapped departments details.	en
first_you_have_to_inactivate_all_employee_mapping	First you have to inactivate all employee mapping.	en
error_while_employee_deactivating	Error while employee deactivating.	en
function_deactivated_successfully	Function deactivated successfully.	en
removed	Suppression	fr
current_password_should_not_be_same_as_your_previous_3_passwords	Aktuelles Passwort nicht identisch mit Ihrer bisherigen 3 Passwörter sein 	de
site_already_exists_with_this_name_please_select_a_different_name	Site existe déjà avec ce nom! Se il vous plaît choisir un nom différent.	fr
enter_site_name	Entrez le nom du site.	fr
enter_site_address	Entrez l adresse du site.	fr
enter_site_short_name	Enter site short name.	en
enter_site_short_name	Geben Sie Baustelle Kurznamen. 	de
enter_site_short_name	Entrer sur le site nom court.	fr
enter_phone_number	Entrez le numéro de téléphone	fr
enter_city	Entrez la ville.	fr
enter_fax_number	Entrez le numéro de fax.	fr
enter_state_name	Enter state name.	en
enter_state_name	Geben Staat Namen.	de
enter_state_name	Entrez le nom de l'Etat.	fr
enter_country_name	Enter country name.	en
enter_country_name	Geben Ländernamen.	de
enter_country_name	Entrez le nom du pays.	fr
enter_pincode	Entrez le code PIN.	fr
please_enter_site_location	Se il vous plaît Entrez Emplacement du site.	fr
select_a_valid_site	sélectionner un site valide	fr
first_you_have_to_inactivate_all_function_and_sop_mapping	First you have to inactivate all function and sop mapping.	en
no_employee_found_for_selected_function_code	No Employee found for selected function code.	en
remove_function_mapping	Remove Function Mapping	en
please_change_sop_mapping	Please Change SOP Mapping from SOP Management.	en
no_test_found_for_selected_ref_doc_no	No test found for selected Ref. Doc. No.	en
sop_inactivate_successfully	SOP inactivate successfully.	en
function_mapping	Function Mapping	en
to_do_list	To Do List	en
user already logged in	Benutzername bereits angemeldet. 	de
assigned_date	Assigned Date	en
information_has_been_updated_successfully	L information a été mise à jour avec succès.	fr
show_all	Show All	en
attended	Attended	en
site	site	fr
dept.name	Nom Département	fr
select_attempt	Select Attempt	en
department_head	chef de département	fr
is_sub_department	Is Sub Department	en
is_sub_department	Ist Sub-Abteilung	de
select_image	Select Image	en
select_audio_video_file	Select Audio/Video File	en
is_sub_department	Est Sous Département	fr
rt	(RT)	en
command.add	ajouter	fr
mapped_sites	Sites mappés	fr
authenticate	Authenticate	en
this_action_requires_a_sign_off	This action requires a sign off. Please login with your userid and password.	en
save	Enregistrer	fr
emp_status	Status:	en
completed_status	Completed	en
creation	Creation	en
induction	Induction	en
mandatory	Mandatory	en
creation_edit	Creation/Edit	en
acceptance	Acceptance	en
approval	Approval	en
parent_department	Parent Department	en
parent_department	Übergeordnete Abteilung	de
parent_department	Département de Parent	fr
first_complete_induction_training	First complete Induction Training.	en
job_description_not_created_or_not_approved	Job Description not created or not approved by the head of the department.	en
is_active	est active	fr
function_approved_succesfully	Function approved succesfully.	en
enter_department_name	Entrez un nom de service.	fr
no_function_pending_for_approval	No function pending for approval.	en
accept	Accept	en
no_job_description_pending_for_approval	No job description pending for approval.	en
this_sop_is_read_acknowledge	This SOP is Read & Acknowledge.	en
no_sop_pending_for_approval	No SOP pending for approval.	en
please_select_department_head	Please select department head.	en
please_select_department_head	Se il vous plaît sélectionnez chef de service.	fr
no_empty	No empty	en
please_select_department_head	Bitte wählen Abteilungsleiter.	de
select_report_type	Select Report Type	en
please_select_a_sop_to_search	Please select a SOP to search.	en
employee_sop_mapping_does_not_exist	Employee to SOP Mapping Does not exist.	en
no_sop_found_for_seleceted_employee	No SOP Found For Seleceted Employee.	en
please_select_parent_department	Please select Parent Department.	en
please_select_parent_department	Bitte wählen Sie Übergeordnete Abteilung.	de
please_select_parent_department	Se il vous plaît sélectionnez Département Parent	fr
department_and_parent_department_are_same	Department and Parent Department are same.	en
department_and_parent_department_are_same	Abteilung und Eltern Abteilung sind gleich.	de
department_and_parent_department_are_same	Ministère et Parent Département sont les mêmes.	fr
please_enter_values	Please Enter Values.	en
n_a	N/A	fr
active	actif	fr
inactive	inactif	fr
msg.no_match_found	Aucune correspondance trouvée.	fr
mapped_modules	Mapped Modules	en
default_permissions	Default Permissions	en
screen_names	Screen Names	en
additional_permissions	Additional Permissions	en
please_select_a_module	Please select a module.	en
updated_permissions_for_employee	Updated Permissions for Employee 	en
all_resources_permission	All Resources Permission	en
task	Task	en
assignees	Assignees	en
remove	supprimer	fr
log_out	Log out	en
please_enter_the_comments_which_will_be_used_to_close_all_active_training	Please enter the comments which will be used to close all active trainings and inactivate this employee. To view current open trainings please click on View Trainings.	en
enter_department_to_edit	Entrez Département à modifier.	fr
please_enter_a_valid_userid_and_password_and_comment	Please enter a valid userid and password and comment	en
username_and_password_does_not_match	Username and Password does not match.Please try again.	en
sign_off	Sign Off	en
p_personal	P : Personal,	en
a_asociated	A : Associated, 	en
g_group	G : Group, 	en
s_subscribe	S : Subscribe	en
select_department_name	Sélectionnez Nom du département.	fr
mapped_site_not_found_please_try_again	Mapped Site not found,please try again!	en
department_has_been_created_successfully	Department has been created successfully.	en
department_has_been_updated_successfully	Department has been updated successfully	en
error_while_updating_department	Error while updating Department.	en
error_while_creating_desgination	Error while creating desgination	en
designation_updated_successfully	Designation Updated Successfully.	en
error_while_updating_designation	Error while Updating Designation.	en
no_designations_found	No Designations Found.	en
resources_mapped_successfully_with_modules_and_roles	Resources Mapped Successfully with Modules and Roles.	en
error_while_mapping_resources	Error while mapping resources.	en
added_succesfully	Added Succesfully.	en
error_please_try_again_later_or_contact_administrator	Error please try again later or contact administrator.	en
please_select_a_mapping	Se il vous plaît Sélectionnez une cartographie	fr
please_select_proper_value_from_the_site	Se il vous plaît sélectionner une valeur appropriée à partir du Site	fr
please_enter_a_valid_department	Please enter a valid department.	en
please_enter_a_valid_department	Bitte geben Sie eine gültige Abteilung	de
please_enter_a_valid_department	Se il vous plaît entrer un département valide	fr
designation	désignation	fr
group	groupe	fr
mapped_group	Groupe mappé	fr
select_appropriate_group	Sélectionnez le groupe approprié.	fr
enter_designation	Entrez Désignation.	fr
please_enter_designation	Please enter designation	en
please_enter_designation	Bitte geben Sie Bezeichnung	de
please_enter_designation	Se il vous plaît entrer désignation	fr
view	vue	fr
edit	éditer	fr
parent/sub_department	Parent/Sub Department	en
parent/sub_department	Eltern / Sub-Abteilung	de
parent/sub_department	Parent / Département Sous	fr
bands	Bands	en
bands	Bands	de
bands	bandes	fr
name_of_designation	Nom de la désignation	fr
add	ajouter	fr
restricted_access	Restricted Access.	en
restricted_access	Eingeschränkter Zugriff	de
restricted_access	Accès limité	fr
please_select_appropriate_group	Se il vous plaît sélectionnez le groupe approprié	fr
please_select_appropriate_desig	se il vous plaît sélectionnez Desig appropriée	fr
select_appropriate_department	sélectionnez département approprié	fr
please_map_designation_to_atleast_one_site	Se il vous plaît carte désignation atleast un seul site	fr
please_select_designation	Se il vous plaît sélectionnez désignation	fr
error_while_creating_designation	Erreur lors de la création de la désignation	fr
exp.please_select_desig_to_search	Se il vous plaît sélectionnez la désignation à rechercher	fr
designation_not_available_for_selected_level	Désignation non Disponible au niveau Sélectionné	fr
mapping_already_added	Cartographie déjà ajouté	fr
select_role	Sélectionner un rôle	fr
select_module	Sélectionnez Modules	fr
select_all	sélectionner tout	fr
please_select_atleast_one_role	Please Select atleast one Role.	en
sent_from	Envoyé De	fr
please_select_atleast_one_role	Bitte wählen atleast eine Rolle.	de
please_select_atleast_one_role	Se il vous plaît sélectionner au moins un rôle.	fr
please_select_atleast_one_module	Please select atleast one Module.	en
please_select_atleast_one_module	Bitte wählen Sie atleast einem Modul.	de
please_select_atleast_one_module	Se il vous plaît sélectionner un module atleast.	fr
please_select_atleast_one_resource_to_map	Please select atleast one resource to map.	en
please_select_atleast_one_resource_to_map	Bitte wählen Sie atleast eine Ressource zur Karte.	de
please_select_atleast_one_resource_to_map	Se il vous plaît sélectionner au moins une ressource à la carte.	fr
no_resources_available	No Resources available.	en
no_resources_available	Keine Ressourcen verfügbar.	de
no_resources_available	Pas de ressources disponibles.	fr
no_mappings_available	No Mappings Available. Please Add Mappings.	en
no_mappings_available	Keine Zuordnungen verfügbar. Bitte hinzufügen Mappings.	de
no_mappings_available	Aucun mappages Disponible. Se il vous plaît ajouter des mappages.	fr
tab.create	créer	fr
emp_id	employé ID	fr
salutation	salutation	fr
mrs	mme	fr
mr	M.	fr
miss	manquer	fr
dr	Dr.	fr
firstname	prénom	fr
middlename	Middle Name	en
middlename	zweiter Vorname	de
middlename	deuxième nom	fr
lastName	nom de famille	fr
contact_no	Contactez No.	fr
qualification	qualification	fr
experience_at_time_of_joining	Experience at time of joining	en
experience_at_time_of_joining	Erleben Sie zum Zeitpunkt des Beitritts	de
experience_at_time_of_joining	Expérience au moment de l'adhésion	fr
date_of_joining	Date d adhésion	fr
email	email	fr
upload_picture	Uploader une image	fr
department	département	fr
reporting_manager	reporting Manager	fr
action	action	fr
certificate	Certificate	en
certificate	Zertifikat	de
certificate	certificat	fr
id_already_exists_please_select_other_id	ID existe déjà! Se il vous plaît choisir d autres ID.	fr
enter_employee_id	Entrez ID d employé.	fr
select_appropriate_salutation	Sélectionnez salutation appropriée	fr
enter_employee_name	Entrez nom de l employé	fr
please_specify_qualification_for_the_employee	Se il vous plaît indiquer qualification pour l'employé	fr
enter_years_of_experience	Entrez ans d'expérience	fr
enter_date_of_joining	Date d'adhésion Entrez	fr
Please_enter_an_email_address	Please enter an email address	en
Please_enter_an_email_address	Bitte geben Sie eine E-Mail-Adresse	de
Please_enter_an_email_address	Se il vous plaît entrer une adresse e-mail	fr
please_add_mappings_for_employee	Please add mappings for employee.	en
please_add_mappings_for_employee	Bitte fügen Sie Zuordnungen für Mitarbeiter.	de
please_add_mappings_for_employee	Se il vous plaît ajouter des mappages pour l'employé.	fr
select_designation_roles	Sélectionnez la désignation et rôles	fr
please_provide_valid_E-mail_address	Please provide valid E-mail address	en
please_provide_valid_E-mail_address	Bitte geben Sie gültige E-Mail-Adresse	de
please_provide_valid_E-mail_address	Se il vous plaît fournir l'adresse e-mail valide	fr
enter_number_in_digits	Enter number in digits.	en
enter_number_in_digits	Geben Sie die Nummer in Ziffern	de
enter_number_in_digits	Entrez le numéro à deux chiffres	fr
error_while_uploading_image	Error while uploading Image.	en
error_while_uploading_image	Fehler beim Hochladen Bild	de
error_while_uploading_image	Erreur lors du chargement image	fr
employee_already_mapped	Employé déjà mappé	fr
please_enter_certificate	Please enter certificate.	en
please_enter_certificate	Bitte geben Zertifikat.	de
please_enter_certificate	Se il vous plaît entrer certificat.	fr
please_select_a_valid_employee	Se il vous plaît Sélectionnez un employé valide	fr
change_picture	Change Picture	en
change_picture	Bild ändern	de
change_picture	Modifier l'image	fr
please_enter_employeeId	Please enter employeeId.	en
please_enter_employeeId	Bitte geben Sie die Mitarbeiter-ID	de
please_enter_employeeId	Se il vous plaît entrer Employee ID	fr
please_add_mappings_to_employee	Please add mappings to Employee.	en
please_add_mappings_to_employee	Bitte fügen Sie Zuordnungen zu Mitarbeiter.	de
please_add_mappings_to_employee	Se il vous plaît ajouter des mappages à l'employé.	fr
please_add_roles_for_the_given_employee	Se il vous plaît Ajouter des rôles pour l'employé donné	fr
please_provide_a_valid_name	Se il vous plaît fournir un nom valide	fr
please_provide_a_last_name	Se il vous plaît fournir un nom	fr
image_file_size_must_be_less_than_2 Mb	Image file size must be less than 2 Mb	en
image_file_size_must_be_less_than	La taille du fichier image doit être inférieure à 2 Mb	fr
please_upload_a_PNG_or_JPEG_file	Please upload a PNG or JPEG file.	en
please_upload_a_PNG_or_JPEG_file	Bitte laden Sie eine PNG oder JPEG-Datei	de
please_upload_a_PNG_or_JPEG_file	Se il vous plaît télécharger un fichier PNG ou JPEG	fr
image_file_size_must_be_less_than_2 Mb	Größe der Bilddatei muss kleiner als 2 MB sein	de
error_while_updating_employee_picutre	Error while Updating employee Picutre.	en
error_while_updating_employee_picutre	Fehler beim Aktualisieren der Mitarbeiter Picutre	de
error_while_updating_employee_picutre	Erreur lors de la mise à jour employé Picutre	fr
accepted_by	accepté par	fr
picture_updated_succesfully	Picture updated Succesfully.	en
picture_updated_succesfully	Bild aktualisiert Erfolgreich	de
picture_updated_succesfully	Photo mis à jour avec succès se	fr
please_select_an_employee	Se il vous plaît Sélectionnez une emplyee	fr
please_select_a_department	Se il vous plaît sélectionner un département	fr
please_select_a_valid_department	Se il vous plaît sélectionner un ministère valide	fr
please_select_a_valid_designation	Se il vous plaît sélectionner une désignation valide.	fr
no_certifications	Aucun Certifications	fr
no_employees_found	Pas trouvé employés.	fr
valid_till_date_(in_months)	Valable jusqu'à la date (en mois)	fr
next_review_date_(in_months)	Suivant Date (en mois)	fr
no_of_questions	Nombre de questions	fr
no_of_options	Nombre d'options	fr
min_passing_percentage	Pourcentage minimum Passing	fr
max_attempts	Nombre maximum de tentatives	fr
please_select_reporting_manager	Please select Reporting Manager.	en
please_select_reporting_manager	Se il vous plaît sélectionnez Gestionnaire de rapports.	fr
please_select_reporting_manager	Bitte wählen Sie Berichtmanager .	de
mapping_already_added_for_selected_site	Mapping already added for selected site.	en
mapping_already_added_for_selected_site	Abbildung bereits für ausgewählte Baustelle hinzugefügt.	de
mapping_already_added_for_selected_site	Cartographie déjà ajouté du site sélectionné	fr
set_regeneraion_year	Réglez régénération Année	fr
module_name	Modulname	de
module_name	Nom du module	fr
training_start_date_interval	Formation Date de début Intervalle	fr
set_trainer_expiration_interval_(in_years)	Réglez Expiration intervalle entraîneur (en années)	fr
functional_code	Code de fonction	fr
send_approval_to	Envoyer Approbation Pour	fr
functional_name	Nom de la fonction	fr
functional_description	fonction Description	fr
department_already_added	Department already added.	en
department_already_added	Abteilung bereits hinzugefügt	de
department_already_added	Département déjà ajouté	fr
weekly_mail	Jour prévu de hebdomadaire Mail(0 = dimanche 6 = samedi)	fr
approved	genehmigt	de
approved	approuvé	fr
email_hostname	email Hostname	fr
under_approval	Under Approval	en
under_approval	unter Zulassung	de
email_port	email Port	fr
under_approval	Sous Approbation	fr
add/view_job_responsibilities	Add/View Job Responsibilities	en
email_id	email Id	fr
add/view_job_responsibilities	Berichte anschauen / hinzufügen Job Verantwortlichkeiten	de
add/view_job_responsibilities	Ajouter Responsabilités / Voir emplois	fr
email_password	courriel Mot de passe	fr
finalize	Finalize	en
finalize	zum Abschluss bringen	de
finalize	finaliser	fr
employee_name_jd	(Employee name),	en
user_has_been_created_successful_password_has_been_sent_to_registered_email_address	L utilisateur a été créé avec succès mot de passe a été envoyé à l adresse e-mail enregistrée	fr
please_contact_your_reporting_manager_for_any_discrepancy	Please contact your reporting manager for any discrepancy	en
please_contact_your_reporting_manager_for_any_discrepancy	Bitte kontaktieren Sie Ihren Berichtsmanager für Diskrepanzen	de
please_contact_your_reporting_manager_for_any_discrepancy	Se il vous plaît contacter votre gestionnaire de rapports pour toute divergence	fr
sr_no	Sr.No.	en
sr_no	numéro de série	fr
sr_no	Ordnungsnummer	de
responsibilities	responsabilités	fr
no_responsibilities_found	NO Responsibilities Found.	en
no_responsibilities_found	KEINE Verantwortlichkeiten gefunden	de
no_responsibilities_found	Pas de responsabilités trouvés	fr
user_has_been_created_successfully_error_while_sending_mail	L utilisateur a été créé avec succès. Erreur lors de l envoi de courrier	fr
user_already_exists_with_employee_id	Utilisateur existe déjà avec id employé donné:	fr
error_while_creating_employee	Erreur lors de la création de l'employé	fr
create/update_role	Create/Update Role	en
create/update_role	Erstellen / aktualisieren Rolle	de
create/update_role	Créer / Mettre à jour Rôle	fr
system_user	Les utilisateurs du système	fr
modules	Modules	en
modules	Module	de
modules	modules	fr
module's_role	Modul Die Rolle	de
please_select_a_site	Se il vous plaît Sélectionnez un site	fr
please_select_atleast_one_modules	Please Select Atleast One Modules	en
please_select_atleast_one_modules	Bitte wählen Sie atleast ein Modul	de
please_select_atleast_one_modules	Se il vous plaît sélectionner au moins un module	fr
please_select_atleast_one_employee	Please Select Atleast One Employee	en
please_select_atleast_one_employee	Bitte wählen atleast Ein Angestellter	de
please_select_atleast_one_employee	Se il vous plaît sélectionner au moins un employé	fr
user_mapped_with_module	User Mapped with Module	en
user_mapped_with_module	Benutzer mit Modul Mapped	de
user_mapped_with_module	Utilisateur mappé avec le module	fr
Module Registration	Inscription Module	fr
module_registration	Module Registration	en
module_registration	Anmeldung für Module	de
module_and_role_assigned_to_employee_to_successfully	Module and role assigned to employee to successfully.	en
module_and_role_assigned_to_employee_to_successfully	Module und die Rolle der Mitarbeiter zugeordnet erfolgreich.	de
module_and_role_assigned_to_employee_to_successfully	Module et le rôle attribué à l'employé avec succès.	fr
error_while_module_and_role_mapping_to_employee	Error while module and role mapping to employee.	en
error_while_module_and_role_mapping_to_employee	Fehler beim Modul und Rollenzuordnung der Mitarbeiter	de
error_while_module_and_role_mapping_to_employee	Erreur alors que le module et le rôle de la cartographie employé	fr
please_select_system_user	Please select System user.	en
please_select_system_user	Bitte wählen Sie Systembenutzer	de
please_select_system_user	Se il vous plaît sélectionnez l'utilisateur Système	fr
select_modules	Select Modules	en
select_modules	Wählen Sie die Module	de
role_name	Role Name	en
role_name	Rollenname	de
role_name	rôle Nom	fr
module_name	Module Name	en
close	près	fr
new_role_name	New Role Name	en
new_role_name	neu Rollenname 	de
new_role_name	Nouveau Rôle Nom	fr
please_enter_role_name	Please enter role Name.	en
please_enter_role_name	Bitte geben Sie Rolle-Name	de
please_enter_role_name	Se il vous plaît entrer rôle Nom	fr
please_select_module_name	Please select module name.	en
please_select_module_name	Bitte wählen Sie Modulname	de
please_select_module_name	Se il vous plaît sélectionnez le nom du module	fr
mapping_removed	Mapping removed.	en
mapping_removed	Abbildung entfernt	de
mapping_removed	cartographie retiré	fr
role_created_successfully	Role Created successfully.	en
role_created_successfully	Rolle erfolgreich Erstellt	de
role_created_successfully	Rôle Créé avec succès	fr
error_while_creating_role	Error while creating role.	en
error_while_creating_role	Fehler beim Erstellen Rolle	de
error_while_creating_role	Erreur lors de la création de rôle	fr
selected_role_not_found	Selected Role Not Found.	en
selected_role_not_found	Ausgewählte Rolle nicht gefunden	de
selected_role_not_found	Rôle sélectionnée Non Trouvé	fr
role_updated_successfully	Role Updated Successfully.	en
role_updated_successfully	Rolle erfolgreich aktualisiert	de
role_updated_successfully	Rôle correctement mis à jour	fr
error_while_updating_roles	Error while updating Roles.	en
error_while_updating_roles	Fehler beim Aktualisieren von Rollen	de
error_while_updating_roles	Erreur lors de la mise à jour des rôles	fr
modules_role	Module's Role	en
modules_role	Rôle du Module	fr
sop	SOP	fr
sop_valid_till_date_(in_months)	Valid Till Date (in Months)	en
sop_valid_till_date_(in_months)	Gültig bis heute (in Monaten)	de
sop_valid_till_date_(in_months)	Valable jusqu'à la date (en mois)	fr
sop_next_review_date_(in_months)	Next Review Date(in months)	en
sop_next_review_date_(in_months)	Nächste Bewertung Datum (in Monaten)	de
sop_next_review_date_(in_months)	Suivant Date (en mois)	fr
sop_no_of_questions	No Of Questions	en
sop_no_of_questions	Anzahl der Fragen	de
sop_no_of_questions	Nombre de questions	fr
sop_no_of_options	No Of Options	en
sop_no_of_options	Anzahl Optionen	de
sop_no_of_options	Nombre d'options	fr
sop_min_passing_percentage	Min Passing Percentage	en
sop_min_passing_percentage	Mindest Passing Prozent	de
sop_min_passing_percentage	Pourcentage minimum Passing	fr
sop_max_attempts	Max Attempts	en
sop_max_attempts	maximale Versuche	de
sop_max_attempts	Nombre maximum de tentatives	fr
sop_expiry_reminder_month	SOP Expiry Reminder Month (Should Be Less Than Valid Till Date (in Months))	en
sop_expiry_reminder_month	SOP Mois d'expiration Rappel (doit être inférieure à Valable jusqu'à la date (en mois))	fr
sop_expiry_reminder_month	SOP Ablauferinnerungs Monat (sollte weniger als gültig bis Datum (in Monaten))	de
send_mail_to_before_SOP_is_expired	Send mail to before SOP is expired	en
send_mail_to_before_SOP_is_expired	Mail an vor SOP ist abgelaufen	de
send_mail_to_before_SOP_is_expired	Envoyez un courriel à avant SOP est expiré	fr
sop_training_regeneration_years	Set Regeneration Year	en
sop_training_regeneration_years	Stellen Regeneration Jahr	de
sop_training_regeneration_years	Réglez régénération Année	fr
sop_training_regeneration_start_date_interval	Training Start Date Interval	en
sop_training_regeneration_start_date_interval	Ausbildung Startdatum Intervall	de
sop_training_regeneration_start_date_interval	Formation Date de début Intervalle	fr
sop_set_trainer_expiration_interval_(in_years)	Set Trainer Expiration Interval (In Years)	en
sop_set_trainer_expiration_interval_(in_years)	Stellen Trainer Ablaufintervall (in Jahren)	de
sop_set_trainer_expiration_interval_(in_years)	Réglez Expiration intervalle entraîneur (en années)	fr
sop_send_approval_to	Send Approval To	en
sop_send_approval_to	Senden Sie Genehmigung	de
sop_send_approval_to	Envoyer Approbation Pour	fr
display_no._of_question	Display No. Of Question	en
display_no._of_question	Anzeige Anzahl der Frage	de
display_no._of_question	Affichage Nombre de question	fr
training_certificate	Training Certificate	en
training_certificate	Ausbildungsnachweis	de
training_certificate	Certificat de formation	fr
sop_name	Nom SOP	fr
function	Function	en
function	Funktion	de
function	fonction	fr
trainer_certificate_required	Trainer Certificate Required	en
trainer_certificate_required	Certificat formateur Requis	fr
trainer_certificate_required	Ausbildung  Zertifikaterforderlich	de
yes	oui	fr
no	aucun	fr
mailscheduled_day	Courrier Prévu Jour	fr
scheduler_weekly_day	Weekly Mail Schedule Day(0=sunday to 6=saturday)	en
scheduler_weekly_day	wöchentlich Mail geplant Tag(0 = Sonntag bis 6 = Samstag)	de
scheduler_weekly_day	Jour prévu de hebdomadaire Mail(0 = dimanche 6 = samedi)	fr
cams_email_hostname	Email Hostname	en
cams_email_hostname	E-Mail-Hostname	de
cams_email_hostname	email Hostname	fr
cams_email_port	Email Port	en
cams_email_port	E-Mail-Port	de
cams_email_port	email Port	fr
cams_email_id	Email Id	en
cams_email_id	E-Mail ID	de
cams_email_id	email Id	fr
cams_email_password	Email Password	en
cams_email_password	E-Mail Passwort	de
cams_email_password	courriel Mot de passe	fr
change_password	changer le mot de passe	fr
emp_name	Nom de l'employé	fr
confirm_password	Confirmez le mot de passe	fr
forced_password_reset_days	Forced Password Reset Days	en
forced_password_reset_days	Zwangs Passwort zurücksetzen Tage	de
forced_password_reset_days	Forced Password Reset Jours	fr
password_reset_in_days	Password reset in days	en
password_reset_in_days	Kennworts in Tagen	de
password_reset_in_days	Mot de passe réinitialisation dans jours	fr
mail_schedular	Ordonnanceur Mail	fr
mail_scheduler	Mail Scheduler	en
mail_scheduler	Mail-Scheduler	de
scheduler_on/off	Scheduler ON/OFF	en
scheduler_on/off	Scheduler ON / OFF	de
scheduler_on/off	Planificateur ON / OFF	fr
please_specify_valid_till_date	Please specify Valid Till Date.	en
please_specify_valid_till_date	Bitte geben Sie Gültig bis heute	de
please_specify_valid_till_date	Se il vous plaît indiquer valide jusqu'à la date	fr
please_enter_numeric_value	Please Enter Numeric Value.	en
please_enter_numeric_value	Bitte numerischen Wert	de
please_enter_numeric_value	Se il vous plaît Entrez Valeur numérique	fr
please_specify_next_review_date	Please specify Next Review Date.	en
please_specify_next_review_date	Bitte geben Nächste Bewertung Datum	de
please_specify_next_review_date	Se il vous plaît indiquer Suivant Date de révision	fr
please_specify_the_month	Please specify the Month.	en
please_specify_the_month	Bitte geben Sie das Monat	de
please_specify_the_month	Se il vous plaît spécifier le Mois	fr
please_specify_the_sender_mail_to_email_Id	Please specify the Sender mail To Email Id.	en
please_specify_the_sender_mail_to_email_Id	Bitte geben Sie die Sender mail Um Id Mail	de
please_specify_the_sender_mail_to_email_Id	Se il vous plaît spécifier l'e-mail de l'expéditeur Pour eMail ID	fr
valid_till_date_value_must_be_greater_than_next_review_date	Valid Till date value Must be Greater than Next Review Date	en
valid_till_date_value_must_be_greater_than_next_review_date	Gültig Bis heute Wert muss größer als Nächstes schreiben Datum sein	de
valid_till_date_value_must_be_greater_than_next_review_date	Valable Till valeur de date doit être supérieur Suivant Date de révision	fr
please_specify_no_of_questions	Please specify No Of Questions.	en
please_specify_no_of_questions	Bitte geben Sie Anzahl der Fragen	de
please_specify_no_of_questions	Se il vous plaît spécifier le nombre de questions	fr
please_specify_no_of_options	Please specify No Of Options.	en
please_specify_no_of_options	Bitte geben Sie Anzahl von Optionen	de
please_specify_no_of_options	Se il vous plaît indiquer Nombre d'options	fr
please_specify_min_passing_percentage	Please specify Min Passing Percentage.	en
please_specify_min_passing_percentage	Bitte geben Mindest Vorbei Prozent	de
please_specify_min_passing_percentage	Se il vous plaît indiquer minimum Passing Pourcentage	fr
please_enter_real_value_between[1-100] e.g.70.1	Please Enter Real Value between[1-100] e.g.70.1	en
please_enter_real_value_between[1-100] e.g.70.1	Bitte geben Sie Real Value zwischen [1-100] e.g.70.1	de
please_enter_real_value_between[1-100] e.g.70.1	Se il vous plaît Entrer une valeur réelle entre [1-100] e.g.70.1	fr
please_specify_maximum_attempts	Please specify Maximum Attempts.	en
please_specify_maximum_attempts	Bitte geben Sie Maximale Versuche.	de
please_specify_maximum_attempts	Se il vous plaît spécifier maximum de tentatives.	fr
please_enter_regenearation_year	Please Enter Regenearation Year.	en
please_enter_regenearation_year	Bitte geben Sie Regenearation Jahr	de
please_enter_regenearation_year	Se il vous plaît Entrez Regenearation Année	fr
please_enter_training_start_date_interval	Please Enter Training Start Date Interval.	en
please_enter_training_start_date_interval	Bitte geben Sie Starten Sie den gewünschten Zeitraum ein.	de
please_enter_training_start_date_interval	Se il vous plaît Entrez Date de début Intervalle	fr
please_enter_trainer_expiration_interval	Please Enter Trainer Expiration Interval.	en
please_enter_trainer_expiration_interval	Bitte geben Sie Trainer Ablaufintervall	de
please_enter_trainer_expiration_interval	Se il vous plaît Entrez formateur Expiration Intervalle	fr
please_enter_send_approval_to_email_id	Please Enter Send Approval To Email Id.	en
please_enter_send_approval_to_email_id	Bitte geben Sie senden Einverständnis auf die Id Mail	de
please_enter_send_approval_to_email_id	Se il vous plaît Entrez Envoyer Approbation Pour eMail ID	fr
please_enter_display_no_of_questions	Please Enter display no of questions.	en
please_enter_display_no_of_questions	Bitte Wählen Sie die Display Reihe von Fragen	de
please_enter_display_no_of_questions	Se il vous plaît Entrez le numéro d'affichage de questions	fr
display_questions_must_be_less_than_or_equal_to_total_questions	Display questions must be less than or equal to total questions.	en
employee_name_jd	(Mitarbeitername),	fr
display_questions_must_be_less_than_or_equal_to_total_questions	Fragen Anzeige muss kleiner als oder gleich dem Gesamt Fragen sein	de
please_select_induction_date	Se il vous plaît sélectionner la date à induction	fr
display_questions_must_be_less_than_or_equal_to_total_questions	Afficher les questions doivent être inférieure ou égale aux questions totales	fr
please_upload_induction_sheet	Bitte laden Induktionsblatt	de
please_enter_a_valid_training_allowance_period	Please enter a valid Training allowance period.	en
please_enter_a_valid_training_allowance_period	Bitte geben Sie eine gültige Ausbildungsvergütung Zeit	de
please_enter_a_valid_training_allowance_period	Se il vous plaît entrer dans une période de l'allocation de formation valide	fr
information_updated_successfully	Information mise à jour avec succès	fr
error_while_updating	Erreur lors de la mise à jour	fr
please_specify_email_hostname	Please specify Email Hostname.	en
please_specify_email_hostname	Bitte geben Sie E-Mail-Hostname	de
please_specify_email_hostname	Se il vous plaît indiquer Email Nom d'hôte	fr
please_specify_email_port	Please specify Email Port.	en
please_specify_email_port	Bitte geben Sie E-Mail-Port	de
please_specify_email_port	Se il vous plaît indiquer Email Port	fr
please_specify_password_validity(in days)	Please specify Password Validity(in days).	en
please_specify_password_validity(in days)	Bitte geben Passwort Gültigkeit (in Tagen)	de
please_specify_password_validity(in days)	Se il vous plaît indiquer le mot de passe Validité (en jours)	fr
please_specify_mail_scheduler(in days)	Please specify mail scheduler(in days).	en
please_specify_mail_scheduler(in days)	Bitte geben Sie mail Scheduler (in Tagen)	de
please_specify_mail_scheduler(in days)	Se il vous plaît indiquer électronique ordonnanceur (en jours)	fr
please_specify_weekly_day_scheduler(in days)	Please specify weekly day scheduler(in days).	en
please_specify_weekly_day_scheduler	Se il vous plaît indiquer planificateur de jours par semaine (en jours).	fr
please_specify_weekly_day_scheduler(in days)	Bitte geben Sie wöchentliche Tag Scheduler (in Tagen).	de
please_enter_numeric_value_between_0-6	Please Enter Numeric Value between 0-6	en
please_enter_numeric_value_between	Se il vous plaît Entrez valeur numérique entre 0-6	fr
please_enter_numeric_value_between_0-6	Bitte numerischen Wert zwischen 0-6	de
please_specify_change_password_duration(in days)	Please specify change password duration(in days).	en
please_specify_change_password_duration(in days)	Bitte geben Sie Passwort ändern Dauer (in Tagen)	de
please_specify_change_password_duration(in days)	Se il vous plaît spécifier la durée de changement de mot de passe (en jours)	fr
please_specify_change_password_duration(in days)_greater_than_0	Please specify change password duration(in days) greater than 0.	en
please_specify_change_password_duration(in days)_greater_than_0	Bitte geben Sie Passwort ändern Dauer (in Tagen) größer als 0	de
please_specify_change_password_duration(in days)_greater_than_0	Se il vous plaît spécifier la durée de changement de mot de passe (en jours) supérieur à 0	fr
please_specify_emailId	Please specify EmailId.	en
please_specify_emailId	Bitte geben Sie EmailId	de
please_specify_emailId	Se il vous plaît indiquer emailId	fr
please_enter_valid_emailId	Please Enter Valid EmailId.	en
please_enter_valid_emailId	Bitte geben Sie eine gültige EmailId	de
please_enter_valid_emailId	Se il vous plaît Entrez emailId valide	fr
please_specify_email_password	Please specify Email Password.	en
please_specify_email_password	Bitte geben Sie E-Mail Passwort	de
please_specify_email_password	Se il vous plaît indiquer mail Mot de passe	fr
please_select_employee_name	Please select employee name.	en
please_select_employee_name	Bitte wählen Mitarbeiternamen	de
please_select_employee_name	Se il vous plaît sélectionnez le nom de l'employé	fr
please_enter_password	Please enter Password.	en
please_enter_password	Bitte geben Sie Passwort	de
please_enter_password	Se il vous plaît entrez le mot de passe	fr
password_must_be_contain	Password Must be contain at least 6 characters,atleast 1 number and 1 special characters.	en
password_must_be_contain	Das Passwort muss mindestens 6 Zeichen, atleast 1 Nummer 1 und Sonderzeichen enthalten sein	de
password_must_be_contain	Mot de passe doit être contient au moins 6 caractères, atleast 1 et numéro 1 des caractères spéciaux	fr
please_enter_confirm_password	Please enter confirm password	en
please_enter_confirm_password	Bitte geben Sie das Kennwort bestätigen	de
please_enter_confirm_password	Se il vous plaît entrez le mot de passe de confirmer	fr
password_not_match	Both Password are not matched.please try again	en
password_not_match	Tant Mot de passe ne correspondent pas se il vous plaît essayer à nouveau	fr
password_not_match	Sowohl Passwort stimmen nicht überein Bitte versuchen Sie es erneut	de
do_you_want_to_reset_password	Do you want to reset Password?	en
do_you_want_to_reset_password	Möchten Sie Kennworts?	de
do_you_want_to_reset_password	Voulez-vous réinitialiser le mot de passe?	fr
current_password_should_not_be_same_as_your_previous_3_passwords	Current password should not be same as your previous 3 passwords	en
password_reset_successfully	Password reset Successfully.	en
password_reset_successfully	Passwort erfolgreich zurückgesetzt	de
password_reset_successfully	Mot de passe réinitialisé	fr
error_while_password_reset	Error while password reset.	en
error_while_password_reset	Fehler beim Zurücksetzen des Kennworts	de
error_while_password_reset	Erreur lors de la réinitialisation de mot	fr
please_upload_company_logo	Please upload Company Logo.	en
please_upload_company_logo	Bitte laden Company Logo	de
please_upload_company_logo	Se il vous plaît télécharger Company Logo	fr
sent_on	Envoyé en	fr
please_upload_a_valid_PNG_or_JPEG_file	Se il vous plaît télécharger un fichier PNG ou JPEG valide. Mauvais format de fichier	fr
please_upload_a_valid_pdf_file	Please upload a valid PDF file.	en
please_upload_a_valid_PNG_or_JPEG_file	Please upload a valid PNG or JPEG  file.	en
please_upload_a_valid_PNG_or_JPEG_file	Bitte laden Sie eine gültige PNG- oder JPEG-Datei	de
wrong_file_format	Wrong file format	en
wrong_file_format	Falsches Dateiformat	de
wrong_file_format	Mauvais format de fichier	fr
topic_covered	sujet couvert	fr
mapped_departments	Départements mappés	fr
please_enter_department_name	Please Enter Department Name.	en
please_enter_department_name	Bitte geben Sie Name der Abteilung	de
please_enter_department_name	Se il vous plaît Entrez Nom Département	fr
please_enter_topic_name	Please Enter Topic Name.	en
please_enter_topic_name	Bitte geben Thema Name	de
please_enter_topic_name	Se il vous plaît Entrez Sujet Nom	fr
data_save_sucessfully	Data Save Sucessfully.	en
data_save_sucessfully	Daten speichern Erfolgreich	de
data_save_sucessfully	Enregistrer les données avec succès	fr
sorry_we_can_not_update_the_data	Sorry We can not Update the data.	en
sorry_we_can_not_update_the_data	Leider kann die Daten nicht aktualisieren	de
sorry_we_can_not_update_the_data	Désolé Nous ne pouvons pas mettre à jour les données	fr
remove_successfully	Remove Successfully.	en
remove_successfully	Erfolgreich entfernen	de
remove_successfully	Retirer succès	fr
upload	télécharger	fr
tab.view	vue	fr
tab.edit	éditer	fr
induction_date	Induction Date	en
induction_date	Induktions Datum	de
induction_date	induction date	fr
future_date_not_allowed	Future Date non autorisés	fr
upload_induction_sheet	Upload Induction Sheet	en
upload_induction_sheet	Hochladen Induktionsblatt	de
upload_induction_sheet	Ajouter à induction Fiche	fr
view_uploaded_induction_sheet	View Uploaded Induction Sheet	en
view_uploaded_induction_sheet	Voir Téléchargée induction Fiche	fr
view_uploaded_induction_sheet	Sehen Hochgeladen Induktionsblatt	de
date	date	fr
site_name	Nom du site	fr
select_training	Sélectionnez Training	fr
name_of_trainer	Le nom du formateur	fr
search	recherche	fr
trainings	formations	fr
for_department	pour Département	fr
no_employees_to_update	No Employees to Update.	en
no_employees_to_update	Kein Mitarbeiter zu aktualisieren	de
no_employees_to_update	Pas de travailleurs, d'actualiser	fr
no_trainings_found	Aucun Départements trouvés	fr
please_provide_date_of_training	Se il vous plaît date de formation de fournir	fr
please_select_date_after_the_joining_date	Please select date after the joining date.	en
please_select_date_after_the_joining_date	Bitte wählen Sie Datum nach dem Fügedatum	de
please_select_date_after_the_joining_date	Se il vous plaît choisir le jour après la date rejoindre	fr
please_select_a_training	Se il vous plaît Sélectionnez une formation	fr
please_select_a_date_for_which_the_attendance_sheet_is_uploaded	Please select a date for which the attendance sheet is uploaded.	en
please_select_a_date_for_which_the_attendance_sheet_is_uploaded	Bitte wählen Sie ein Datum, für das die Anwesenheitsliste Anbringung	de
please_select_a_date_for_which_the_attendance_sheet_is_uploaded	Se il vous plaît sélectionner une date pour laquelle la feuille de présence est téléchargé	fr
no_employees_for_selected_department_have_hr_training	No Employees for Selected Department have HR Training	en
no_employees_for_selected_department_have_hr_training	Kein Mitarbeiter für ausgewählte Abteilung haben HR Ausbildung	de
no_employees_for_selected_department_have_hr_training	Aucun Employés pour Département sélectionnés ont Formation HR	fr
hr_training_updated_successfully	Hr Training Updated Successfully.	en
hr_training_updated_successfully	Hr Schulung erfolgreich aktualisiert	de
hr_training_updated_successfully	Formation Hr correctement mis à jour	fr
please_select_induction_date	Please select Induction date.	en
please_select_induction_date	Bitte wählen Sie Induction Datum	de
please_upload_induction_sheet	Veuillez télécharger la feuille d'induction	fr
please_upload_a_valid_pdf_file	Bitte laden Sie eine gültige PDF-Datei	de
please_upload_a_valid_pdf_file	Se il vous plaît télécharger un fichier PDF valide	fr
requested_document_not_found	Document Demandé introuvable	fr
uploaded_file	fichier téléchargé	fr
no_uploaded_induction_sheet_found	No Uploaded Induction Sheet Found.	en
no_uploaded_induction_sheet_found	Kein Hochgeladene Induktionsblatt Gefunden	de
no_uploaded_induction_sheet_found	Aucune Téléchargée induction Fiche Trouvé	fr
please_upload_induction_sheet	Please upload induction sheet.	en
no_departments_found	Aucun Départements trouvés	fr
please_select_a_valid_department_and _dont_edit_the_given_name	Please select a valid Department and Dont Edit the given name.	en
please_select_a_valid_department_and	Se il vous plaît sélectionner un ministère valide et ne modifiez pas le nom donné.	fr
please_select_a_valid_department_and _dont_edit_the_given_name	Bitte wählen Sie ein gültiges Abteilung und Sie den angegebenen Namen nicht bearbeiten	de
please_select_department	Se il vous plaît sélectionnez Département	fr
please_enter_function_code	Please enter function code.	en
please_enter_function_code	Bitte geben Sie den Funktionscode	de
please_enter_function_code	Se il vous plaît entrez le code de fonction	fr
function_code_already_exists	Function code already exists.	en
function_code_already_exists	Funktionscode bereits vorhanden	de
function_code_already_exists	Code de fonction existe déjà	fr
please_enter_function_name	Please enter function name.	en
please_enter_function_name	Bitte geben Sie Funktionsnamen	de
please_enter_function_name	Se il vous plaît entrez le nom de la fonction	fr
please_enter_function_description	Please enter function description.	en
please_enter_function_description	Bitte geben Sie Funktionsbeschreibung	de
please_enter_function_description	Se il vous plaît entrez la description de fonction	fr
function_created_succesfully	Function Created Succesfully.	en
function_created_succesfully	Funktion Erstellt Erfolgreich	de
function_created_succesfully	Fonction Crée succès se	fr
error_while _creating_function_please_try_again_later	Error while creating function.Please try again later.	en
creating_function_please_try_again_later	Erreur lors de la création de la fonction.Se il vous plaît réessayer plus tard.	fr
error_while _creating_function_please_try_again_later	Fehler beim Anlegen Funktion.Bitte seien es später noch einmal versuchen.	de
function_updated_succesfully	Function updated successfully.	en
function_updated_succesfully	Funktion erfolgreich aktualisiert	de
function_updated_succesfully	Fonction correctement mis à jour	fr
error_while _updating_function_please_try_again_later	Error while creating function.Please try again later.	en
error_while _updating_function_please_try_again_later	Fehler beim Aktualisieren-Funktion.Bitte versuchen Sie es später noch einmal.	de
error_while _updating_function_please_try_again_later	Erreur lors de la mise à jour la fonction.Se il vous plaît réessayer plus tard.	fr
department_code	Department code	en
department_code	Abteilungscode	de
department_code	Code Département	fr
sop_upload	SOP Upload	en
sop_upload	SOP hochladen	de
sop_upload	SOP chargement	fr
final_sop_upload	Final SOP Upload	en
final_sop_upload	Schluss SOP hochladen	de
final_sop_upload	Final SOP chargement	fr
training	formation	fr
department_code_created_successfully	Department Code created successfully	en
department_code_created_successfully	Abteilungscode erfolgreich erstellt	de
department_code_created_successfully	Code du Ministère a créé avec succès	fr
department_code_already_exists	Department Code already exists.	en
department_code_already_exists	Abteilungscode erfolgreich erstellt...	de
department_code_already_exists	Code de département existe déjà	fr
please_fill_department_code	Please fill Department Code.	en
please_fill_department_code	Bitte füllen Abteilungscode	de
please_fill_department_code	Se il vous plaît remplir le code de département	fr
no_department_code_exists	No Department Code exists.	en
no_department_code_exists	Kein Abteilungscode vorhanden ist	de
no_department_code_exists	Pas de code de département existe	fr
change_mapping	Changer mappage de fonction	fr
name	nom	fr
description	description	fr
ref_doc_no	Ref. Doc. No.	fr
re-training_period	Re-training Period	en
re-training_period	Umschulung Zeitraum	de
re-training_period	Re-formation Période	fr
revision_no	Numéro de révision	fr
glp_relevant	GLP-Relevant	en
glp_relevant	GLP-relevante	de
glp_relevant	GLP-pertinente	fr
proposed_effective_date	Proposed Effective Date	en
proposed_effective_date	Vorgeschlagene Datum des Inkrafttretens	de
proposed_effective_date	Mise en vigueur	fr
only_read_and_acknowledge	Seulement Lire et Reconnaissez	fr
functional_mapping	Functional Mapping	en
functional_mapping	Funktionszuordnung	de
functional_mapping	cartographie fonctionnelle	fr
jr_based_on	JR basé sur	fr
harmonized	harmonisé	fr
add_remove_media	Ajouter / Supprimer des médias	fr
upload_sop	Ajouter SOP	fr
version/revision_change	Version/Revision Change	en
version/revision_change	Version / Revision ändern	de
version/revision_change	Version / Changer de révision	fr
previous_change_control_no	Précédent Change Control Nombre	fr
training.date.valid	valable Till	fr
please_enter_regenerate_period_in_number	Please Enter Regenerate Period In Number.	en
please_provid_regeneration_period_less_than_validtilldate_month	Please provide regeneration period less than validtilldate_month.	en
attached_document_seems_to_be_empty	Attached document seems to be empty	en
please_map_sop_to_atleast_one_function	Please map SOP to atleast one Function.	en
sop_already_exists_for_this_Ref. Doc. No.	SOP already exists for this Ref. Doc. No.	en
please_select_effective_date	Please select Effective Date.	en
please_enter_sop_name	Please enter SOP name.	en
last_revision_number_and_current_revision_number_are_same	Last Revision Number and Current revision number are same.	en
please_upload_document	Please Upload Document	en
sop_has_been_updated_or_changed	Sop has been updated or changed. Please contact administrator for activation.	en
please_activate_sop	Please Activate SOP.	en
please_select_function_code	Please select Function Code.	en
view_uploaded_file	Voir fichier téléchargé	fr
edit_questions	Modifier questions	fr
please_select_a_category	Se il vous plaît sélectionner une Catégorie	fr
category_already_exists	Catégorie existe déjà	fr
please_select_category_to_be_removed_form_the_list	Se il vous plaît choisir une catégorie à être retiré de la liste	fr
please_provide_reference_document_number	Se il vous plaît fournir Réf. Doc. Non.	fr
reference_document_no_already_exists	Ref. Doc. N ° existe déjà	fr
please_specify_document_mapping	Se il vous plaît préciser la cartographie document	fr
please_provide_SOP_name	Se il vous plaît fournir le nom SOP	fr
please_select_category	Se il vous plaît choisir une catégorie	fr
please_have_a_valid_revision_number	Se il vous plaît avoir un numéro de révision en cours de validité	fr
please_provide_effective_date	Se il vous plaît fournir Date d'effet	fr
please_enter_regenerate_period_in_number	Bitte geben Sie generieren Zeitraum In Nummer	de
please_enter_regenerate_period_in_number	Se il vous plaît entrer une période Régénérer Nombre	fr
please_provid_regeneration_period_less_than_validtilldate_month	Bitte geben Regenerationszeit weniger als validtilldate_month	de
please_provid_regeneration_period_less_than_validtilldate_month	Se il vous plaît fournir période de régénération moins de validtilldate_month	fr
please_provide_future_date	Se il vous plaît fournir avenir date	fr
please_provide_questions	Se il vous plaît fournir des questions	fr
attached_document_seems_to_be_empty	Angebrachtes Dokument scheint leer zu sein	de
attached_document_seems_to_be_empty	Attached document semble être vide	fr
please_map_sop_to_atleast_one_function	Bitte Karte SOP zu atleast eine Funktion	de
please_map_sop_to_atleast_one_function	Se il vous plaît carte SOP à atleast une Fonction	fr
document_has_been_uploaded_successfully	Document a été téléchargé avec succès	fr
sop_already_exists_for_this_Ref. Doc. No.	SOP ist bereits für dieses Ref. Dok. Nein.	de
sop_already_exists_for_this_Ref. Doc. No.	SOP existe déjà pour ce Réf. Doc. Non.	fr
please_provide_document_to_upload	se il vous plaît fournir des documents à télécharger	fr
please_select_effective_date	Bitte wählen Sie Gültigkeitsdatum	de
please_select_effective_date	Se il vous plaît sélectionnez Date effective	fr
please_select_a_reference_document_number	Se il vous plaît Sélectionnez une Réf. Doc. Non.	fr
please_enter_sop_name	geben Sie bitte SOP Namen	de
please_enter_sop_name	se il vous plaît entrez le nom SOP	fr
last_revision_number_and_current_revision_number_are_same	Letzte Revisionsnummer und aktuelle Revisionsnummer sind die gleichen	de
last_revision_number_and_current_revision_number_are_same	Dernier numéro de révision et le numéro de révision actuel sont les mêmes	fr
please_insert_valid_change_control_number	Se il vous plaît Insérez valide Nombre Control Change	fr
please_insert_category	Se il vous plaît Insérez Catégorie	fr
please_upload_document	Bitte Document Galerie	de
please_upload_document	Se il vous plaît Télécharger un document	fr
sop_has_been_updated_or_changed	Sop wurde aktualisiert oder geändert werden. Bitte kontaktieren Sie Administrator für die Aktivierung.	de
sop_has_been_updated_or_changed	Sop a été mis à jour ou modifié. Se il vous plaît contacter l'administrateur pour l'activation.	fr
please_select_a_valid_refrence_document_number	Se il vous plaît sélectionner un valide Réf. Doc. Non.	fr
harmonized_	:[Harmonisé]	fr
please_activate_sop	Bitte aktivieren SOP	de
please_activate_sop	Se il vous plaît activer SOP	fr
please_select_an_sop	Se il vous plaît sélectionner un SOP	fr
please_select_function_code	Bitte wählen Sie Funktionscode	de
designation_category	Designation Category	en
designation_mapping	Designation Mapping	en
roles_permissions	Roles Permissions	en
login_audit	Login Audit	en
admin_configuration	Admin Configuration	en
uploded_induction_training_sheet	Uploded Induction Training Sheet	en
function_code_creation	Function Code Creation	en
sop_department_code	Sop Department Code	en
re_training_generation	Re-Training Generation	en
classroom	Class Room	en
adhoc_training	Adhoc Training	en
primary_id	Primary Id	en
please_select_function_code	Se il vous plaît sélectionnez le code de fonction	fr
please_select_group	Se il vous plaît Sélectionnez Groupe	fr
item_id	Item Id	en
please_select_department_to_get_list_of_function_code	Please select Department to get List of Function Code.	en
please_select_department_to_get_list_of_function_code	Bitte wählen Sie Abteilung Liste Funktionscode erhalten	de
please_select_the_entity_name	Please select the entity Name.	en
please_enter_primary_id	Please enter Primary Id.	en
please_enter_item_id	Please enter Item Id.	en
no_sop_found	Kein SOP gefunden	de
no_sop_found	Pas trouvé SOP	fr
type	Type	en
evaluation	Evaluation	en
module	Module	en
documents	Documents	en
please_select_department_to_get_list_of_function_code	Se il vous plaît sélectionnez Département d'obtenir la liste de code de fonction	fr
function_code_already_mapped	Function code already mapped.	en
question_document	Question Document	en
document	Document	en
please_enter_training_topic	Please Enter Training Topic.	en
please_upload_questions	Please upload questions.	en
view_question_doc	View Question Doc	en
view_adhoc_training	View Adhoc Training	en
view_training_attendance	View Training Attendance	en
select_training_topic	Select Training Topic	en
function_code_already_mapped	Funktionscode bereits zugewiesen	de
function_code_already_mapped	Code de fonction déjà mappé	fr
no_functional_code_found	No Functional Code Found.	en
attendance_sheet	Attendance Sheet	en
result_lower	Result	en
percentage_%	Percentage %	en
no_functional_code_found	Kein Functional-Code gefunden	de
no_functional_code_found	Pas de code fonctionnel Trouvé	fr
please_select_functional_code	Please select functional code.	en
from_date	From Date	en
to_date	To Date	en
view_attendance_sheet	View Attendance Sheet	en
please_select_training_date	Please select Training date	en
please_select_Training_topic	Please select Training topic	en
please_select_training_start_time	Please select Training start Time	en
please_select_training_end_time	Please Select Training end time	en
please_upload_attendance_sheet	Please Upload attendance Sheet.	en
please_search_the_employee_for_trainer	Please search the employee for trainer.	en
please_enter_trainer_name	Please enter trainer name.	en
please_select_end_time_after_the_start_time	Please select end time after the start time.	en
please_map_atleast_one_employee	Please map atleast one employee.	en
please_select_from_date	Please Select From Date.	en
please_select_to_date	Please Select To Date.	en
please_select_a_to_date_which_comes_after_the_from_date.	Please select a To date which comes after the From date.	en
no_uploaded_attendance_sheet_found	No uploaded attendance sheet found	en
percentage(%)	Percentage(%)	en
please_enter_employee_passfail_percentage	Please Enter Employee Passfail Percentage	en
value_must_be_smaller_than_100	Value must be smaller than 100.	en
please_enter_percentage_of_employee_id	Please enter percentage of Employee Id	en
view_trainings	View Trainings	en
search_trainer	Search Trainer	en
please_find_ref_doc_no	Please find Ref. Doc. No.	en
please_select_trainer_name	Please select trainer name.	en
please_enter_score	Please enter score.	en
please_provide_value_for	Please provide value for	en
please_select_date	Please select Date.	en
test_paper	Test Paper	en
please_upload_only_pdf_documents	Please upload only pdf documents.	en
no_training_found_for_selected_ref_doc_no	No training found for selected RefDocNo.	en
no_employee_found_for_test	No employee found for test.	en
no_document_found_for_view	No Document Found For View.	en
no_employee_details_found	No Employee Details Found.	en
updated_permissions_for_role	Updated Permissions for Role	en
please_select_a_resource_to_map	Please select a resource to Map.	en
update_upper	UPDATE	en
certification	Certification	en
upload_certificate	Upload Certificate	en
view_certificate	View Certificate	en
please_upload_trainer_certificate	Please upload trainer certificate.	en
inactive_functionality	Inactive Functionality	en
first_you_have_to_inactivate_all_department_desig	First you have to inactivate all department designation and bands mapping.	en
training_report	Training Report	en
what_do_you_want_to_inactivate	What do you want to inactivate	en
search_ref_doc_no	Search Ref. Doc. No.	en
deactivated_by	Deactivated By	en
remark	Remark	en
pass_fail	Pass/Fail	en
closed_trainings	Closed Trainings	en
select_department	Select Department	en
sub_department_names	Sub Department Names	en
sub_department	Sub Department	en
department_designation_bands_mapping	Department Designation Bands Mapping	en
employee_mapping	Employee Mapping	en
select_designation	Select Designation	en
select_function_code	Select  Function Code.	en
function_details	Function Details	en
ref_doc_no_mapped_on_function	Ref. Doc. No  mapped on Function	en
view_employee	View Employee	en
select_ref_doc_no	Select  Ref. Doc. No.	en
view_functions	View Functions	en
view_test	View Test	en
function_mapped_on_ref_doc_no	Function mapped on Ref. Doc. No.	en
no_closed_training_found	No closed training found.	en
inactivate	Inactivate	en
process_done_successfully	Process done successfully.	en
please_first_deactivate_or_change_designation	Please first deactivate or change designation of all the employees which are mapped on selected department and designation.	en
no_employee_found_for_selected_department_and_designation_mapping	No employee found for selected department and designation mapping.	en
please_select_functional_code	Bitte wählen Sie Funktionscode	de
please_select_functional_code	Se il vous plaît sélectionnez le code fonctionnel	fr
please_enter_revision_number	Please enter revision number.	en
please_enter_revision_number	Bitte geben Sie die Revisionsnummer	de
please_enter_revision_number	Se il vous plaît entrer le numéro de révision	fr
uploaded_questions	Ajouter des questions	fr
srno	Sr. No.	de
srno	Sr. No.	fr
completion_%	Completion %	en
completion_%	Fertigstellung%	de
completion_%	Réussite%	fr
glp	GLP	en
glp	GLP	de
glp	GLP	fr
effective_date	Effective Date	en
effective_date	Datum des Inkrafttretens	de
effective_date	date d'effet	fr
next_review_date	Suivant Date de révision	fr
valid_till_date	Valid Till Date	en
valid_till_date	Gültig bis heute	de
valid_till_date	Valable jusqu'à la date	fr
final_copy	FinalCopy	en
final_copy	Schluss kopieren	de
final_copy	Copie final	fr
please_enter_a_valid_effective_date	Please enter a valid Effective Date.	en
please_enter_a_valid_effective_date	Bitte geben Sie eine gültige Datum des Inkrafttretens	de
please_enter_a_valid_effective_date	Se il vous plaît entrer une date d'effet en cours de validité	fr
please_enter_a_valid_next_review_date	Please enter a valid Next Review Date.	en
please_enter_a_valid_next_review_date	Bitte geben Sie eine gültige Nächste Bewertung Datum	de
set_month	Réglez Mois	fr
please_enter_a_valid_next_review_date	Se il vous plaît entrer un valide Suivant Date de révision	fr
please_enter_a_valid_till_date	Please enter a valid Till Date.	en
please_enter_a_valid_till_date	Bitte geben Sie eine gültige Bis Datum	de
please_enter_a_valid_till_date	Se il vous plaît entrer un valide jusqu'à la date	fr
please_upload_a_valid_sop	Please upload a valid sop	en
please_upload_a_valid_sop	Bitte laden Sie eine gültige sop	de
please_upload_a_valid_sop	Se il vous plaît télécharger un sop valide	fr
sub_category	sous catégorie	fr
internal_external	Interne / Externe	fr
internal	interne	fr
external	externe	fr
training_topic	sujet de la formation	fr
start_date	date de début	fr
error.msg.please_provide_valid_date	Se il vous plaît entrer la date de validité	fr
training_generate	Training Generate	en
training_generate	Ausbildung generieren	de
training_generate	formation Générer	fr
end_date	date de fin	fr
all_employee	All Employee	en
all_employee	alle Mitarbeiter	de
all_employee	Tous les employés	fr
employee_specific	Employee Specific	en
employee_specific	Mitarbeiterspezifische	de
employee_specific	employé spécifique	fr
please_provide_start_date	Se il vous plaît Fournir Date de début	fr
between	entre	fr
and	et	fr
please_select_a_date	Se il vous plaît Choisir une date	fr
please_select_subcategory	Se il vous plaît sélectionnez Sous catégorie	fr
please_select_trainer	Se il vous plaît Sélectionnez formateur	fr
please_provide_training_topic	Se il vous plaît fournir Sujet de la formation	fr
please_provide_end_date	Se il vous plaît Fournir Date de fin	fr
no_employee_selected	No Employee Selected	en
no_employee_selected	Kein Mitarbeiter Ausgewählte	de
no_employee_selected	Aucun employé sélectionné	fr
start_time_can_not_be_less_than_end_time	Heure de départ ne peut pas être inférieure à l'heure de fin	fr
please_provide_a_date_comes_before_effective_date	Se il vous plaît fournir une date, vient avant Date d'effet	fr
please_provide_a_date_comes_after_start_date	Se il vous plaît fournir une date, qui vient après Date de début	fr
please_provide_a_date_comes_before_valid_date	Please provide a date, comes before Valid Date	en
please_provide_a_date_comes_before_valid_date	Bitte geben Sie ein Datum, kommt vor Gültigkeitstag	de
please_provide_a_date_comes_before_valid_date	Se il vous plaît fournir une date, vient avant Date Valide	fr
approved_by	genehmigt durch	de
approved_by	Approuvé par	fr
job_description_version	Job Description Version	en
job_description_version	Job Description Version	de
job_description_version	Description du poste Version	fr
in_absence_of	In absence of	en
in_absence_of	In Abwesenheit von	de
in_absence_of	En l'absence de	fr
company_name	Company Name:	en
company_name	Name der Firma:	de
company_name	Nom de l'entreprise:	fr
report_name	Report Name:	en
report_name	Bezeichnung:	de
report_name	Nom du rapport:	fr
report_date	Report Date:	en
report_date	Bericht Datum:	de
report_date	date du rapport:	fr
sop/document_name	SOP/Document Name	en
sop/document_name	SOP / Dokumentname	de
sop/document_name	SOP / Nom du document	fr
comment	Kommentar	de
comment	commentaire	fr
ok	bien	fr
enter_ref. doc. no.	Enter Ref. Doc. No.	en
enter_ref. doc. no.	Geben Ref. Dok. Nein.	de
no_employee_found_for_that_sop	NO Employee Found For that SOP.	en
no_employee_found_for_that_sop	Kein Mitarbeiter Gefunden Aus diesem SOP	de
no_employee_found_for_that_sop	Aucun employé Pour cette SOP	fr
please_select_employee	Se il vous plaît sélectionnez employé	fr
employee_removed_successfully	Employee removed successfully.	en
employee_removed_successfully	Mitarbeiter erfolgreich entfernt	de
employee_removed_successfully	Employé enlevé avec succès	fr
employee_already_available	Employee Already Available.!	en
employee_already_available	Mitarbeiter bereits verfügbar	de
employee_already_available	Employé Déjà disponible	fr
please_select_a_valid_category	Se il vous plaît sélectionner une catégorie valide	fr
view/edit_justification	View/Edit Justification	en
view/edit_justification	Anzeigen / Bearbeiten Begründung	de
view/edit_justification	Voir / Modifier Justification	fr
justification	Justification	en
justification	Rechtfertigung	de
justification	justification	fr
please_select_functional_code_details	Please select Functional code details	en
please_select_functional_code_details	Bitte wählen Sie Funktionscode Details	de
please_select_functional_code_details	Se il vous plaît sélectionnez les détails de code fonctionnel	fr
please_select_employee_id	Please select employee id.	en
please_select_employee_id	Bitte wählen Sie Mitarbeiter-ID	de
please_select_employee_id	Se il vous plaît choisir l'ID employé	fr
please_select_function_code_for_the_employee	Please select function code for the employee.	en
please_select_function_code_for_the_employee	Bitte wählen Sie den Funktionscode für den Arbeitnehmer	de
please_select_function_code_for_the_employee	Se il vous plaît sélectionner le code de fonction pour l'employé	fr
please_enter_justification_for_the_function	Please enter justification for the function.	en
please_enter_justification_for_the_function	Bitte geben Sie Berechtigung für die Funktion	de
please_enter_justification_for_the_function	Se il vous plaît entrer justification de la fonction	fr
do_you_want_to_remove_mapping	Do you want to remove mapping?	en
do_you_want_to_remove_mapping	Möchten Sie Zuordnung zu entfernen?	de
do_you_want_to_remove_mapping	Voulez-vous retirer la cartographie?	fr
mapping_already_available	Mapping Already Available.	en
mapping_already_available	Mapping bereits verfügbar	de
mapping_already_available	Cartographie Déjà disponible	fr
SOP Function Mapping	SOP Function Mapping	en
SOP Function Mapping	SOP Function Mapping	de
show_all_functions	Zeige alle Funktionen	de
show_all_functions	Show All Functions	en
review_confirm	Rezension  & bestätigen	de
review_confirm	Review & Confirm	en
review_sop_function_mappings	Review SOP Function Mappings	en
previous_mapping	Previous Mapping	en
current_mapping	Current Mapping	en
removed_mapping	Removed Mapping	en
removed_mapping	entfernt Mapping	de
current_mapping	aktuelle Mapping	de
previous_mapping	Vorherige Mapping	de
review_sop_function_mappings	Bewerten SOPFunction Mappings	de
final_mapping	Final Mapping	en
final_mapping	Schluss Mapping	de
existing_mapping	Existing Mapping	en
existing_mapping	vorhandene Mapping	de
new_mapping	New Mapping	en
new_mapping	New Mapping	de
Confirm	Confirm	en
Confirm	bestätigen	de
SOP View Report	SOP View Report	en
SOP View Report	SOP Bericht anzeigen	de
select_sop_type	Select SOP Type	en
effective	Effective	en
select_version_type	Select Version Type	en
current	Current	en
sop_name/documentName	SOP Name/DocumentName	en
no_sop_found	No sop found.	en
this_sop_is_read&Acknowledge	This SOP is Read&Acknowledge.	en
training_sop_report	Training SOP Report	en
sop_report	SOP Report	en
login_Error_please_enter_valid_username_and_password	Please enter valid username and password.	en
login_Error_please_enter_valid_username_and_password	Bitte geben Sie gültigen Benutzernamen und Ihr Passwort ein.	de
user already logged in	User already logged in.	en
user already logged in.	Benutzername bereits angemeldet. 	de
discusit_version_label	Discus IT CAMS v1.0 licence to	en
discusit_version_label	Discus IT CAMS v1.0 Lizenz	de
wfcm_induction_training_type	Induction Training Type	en
please_enter_valid_value	Please Enter Valid Value.	en
comparison	Comparison	en
artwork_search	Search	en
initiate_artwork	Initiate Artwork	en
group_name	Group Name	en
select_user	Select User	en
user_groups	User Groups	en
artwork_files	Artwork files	en
password should contain at least one special character and one number	Password should contain at least one special character and one number.	en
password should contain at least one special character and one number	Passwort sollte mindestens ein Sonderzeichen und eine Zahl enthalten	de
you_are_currently_working_on_site 	You are currently working on site 	en
you_are_currently_working_on_site 	Sie gerade arbeiten vor Ort 	de
you_are_currently_working_on_site	Vous travaillez actuellement sur ​​le site 	fr
company.name	Nom de l entreprise\n\n	fr
address	Adresse	fr
site_short_name	Site Short Name	en
site_short_name	Site nom court 	fr
city	ville	fr
no_details_found_for_selected_employee	Keine Gefunden für ausgewählte Mitarbeiter	de
no_details_found_for_selected_employee	Pas de détails trouvés pour employé sélectionné	fr
job_description	description de l'emploi	fr
status_graph	statut Graphique	fr
deviation	Renoncer-off	fr
blocked_test	essai bloqués	fr
jd_view_by_version	JD View By Version	en
jd_view_by_version	JD Anzeigen nach Version	de
jd_view_by_version	JD Vue par Version	fr
jd_approval	JD Approval	en
jd_creation	JD Creation	en
jd_creation	JD Creation	de
upload_jd	Upload JD	en
upload_jd	hochladen JD	de
upload_jd	Télécharger JD	fr
jd_approval	JD Genehmigung	de
jd_approval	JD Approbation	fr
jd_creation	JD Création	fr
reporting_to	Relevant	fr
dept_training_coordinator	Coordonnateur Département de la formation	fr
jd_upload	JD Upload	en
jd_upload	JD hochladen	de
jd_upload	JD chargement	fr
add_responsibilities	Add Responsibilities	en
add_responsibilities	Fügen Sie Aufgaben	de
add_responsibilities	Ajouter responsabilités	fr
view_responsibilities	View Responsibilities	en
view_responsibilities	Aufgaben anzeigen	de
view_responsibilities	Voir responsabilités	fr
note	Note:	en
note	Hinweis:	de
note	Remarque:	fr
report	Report	en
designee_is_responsible	/Designee is responsible for day to day activity.	en
designee_is_responsible	/Beauftragter ist für die tägliche Aktivität verantwortlich	de
designee_is_responsible	/ Personne désignée est responsable de jours à l'activité de jour	fr
send_for_employee_aceptense	Envoyer Pour employés Acceptation	fr
finalize_JD	Finalize JD	en
finalize_JD	finalisieren JD	de
finalize_JD	finaliser JD	fr
accepted_by	durch akzeptierte	de
employee_name_jd	(Nom de l'employé),	de
please_select_a_valid_employeeId	Please select a valid EmployeeId	en
please_select_a_valid_employeeId	Bitte wählen Sie ein gültiges EmployeeId	de
please_select_a_valid_employeeId	Se il vous plaît sélectionner un EmployeeId valide	fr
please_select_department_coordinator 	Please select Department Coordinator Employee Id.	en
please_select_department_coordinator	Bitte wählen Sie Abteilung Koordinator Mitarbeiter-ID.	de
please_select_department_coordinator	Se il vous plaît sélectionner employés coordonnateur Département Id.	fr
please_enter_responsibilities	Please Enter Responsibilities.	en
please_enter_responsibilities	Bitte geben Sie Aufgaben	de
please_enter_responsibilities	Se il vous plaît Entrez responsabilités	fr
function_code	Function Code	en
function_code	Funktionscode	de
function_code	Code de fonction	fr
no_job_description_revision_no_found	No job description revision no found.	en
no_job_description_revision_no_found	Kein Job-Beschreibung Revisionsnummer gefunden	de
no_job_description_revision_no_found	Aucun numéro description de tâches de révision trouvé	fr
please_select_revision_no	Please select Revision No.	en
please_select_revision_no	Bitte wählen Sie Revisionsnummer	de
please_select_revision_no	Se il vous plaît sélectionnez N ° révision	fr
uploaded_jd	Uploaded JD	en
uploaded_jd	Hochgeladene JD	de
uploaded_jd	Téléchargée JD	fr
this_version_is_under_approval_process	This version is under approval process.	en
this_version_is_under_approval_process	Diese Version ist unter der Genehmigungsprozess	de
this_version_is_under_approval_process	Cette version est en cours de processus d'approbation	fr
name_of_the_employee	Name of the Employee	en
name_of_the_employee	Name des Mitarbeiters	de
induction_training_view	View Induction Training	en
induction_training_dept	Induction Training Department	en
sop_department_code_display_utility	SOP Deparment Code Dienstprogramm	de
sop_department_code_display_utility	SOP Deparment code utility	en
DataUpload	DataUpload	en
DataUpload	DataUpload	de
HR_Training_Created_Successfully	HR Training Created Successfully.	en
reason_for_change	Reason for the change	en
reason_for_change	Grund für die Änderung	de
please_add_reason_for_the_change	Please add reason for the change.	en
please_add_reason_for_the_change	Please add reason for the change.	de
sop_reason_for_change	SOP Reason for change	en
sop_reason_for_change	SOP Änderungsgrund	de
select_criteria	Select Criteria	en
select_criteria	Select Criteria	de
disapproved	DisApproved	en
disapproved	DisApproved	de
induction_training_create	Upload Induction Sheet	en
sop_all_questions_options_display	All Questions Options Display	en
pdf_compare	Proof Reader	en
Error_While_Creating_HR_Training	Error while creating HR training	en
please_insert_category	Bitte Setzen Abteilungscode	de
please_insert_category	Please Insert department code	en
Please_select_date_after_the_joining_date	Please select date after the joining date	en
Please_select_a_date_for_which_the_attendance_sheet_is_uploaded	Please select a date for which the attendance sheet is uploaded	en
Please_provide_reason_for_change	Please provide reason for change.	en
Please_select_parent_department	Please select parent department!	en
Department_and_parent_department_are_same	Department and parent department are same.	en
Please_enter_a_valid_Department	Please enter a valid Department!	en
no_sop_mapped_with_this_function	No sop mapped with this function.	en
no_function_mapped_with_this_sop	No function mapped with this sop.	en
no_function_mapping_found_with_this_employee	No function mapping found with this employee.	en
no_employee_mapping_found_with_this_function	No employee mapping found with this function.	en
no_employee_mapping_found_with_this_sop	No employee mapping found with this sop.	en
no_sop_mapping_found_with_this_employee	No sop mapping found with this employee.	en
function_sop_mapping_report	Function-Sop Mapping Report	en
sop_function_mapping_report	SOP-Function Mapping Report	en
employee_function_mapping_report	Employee-Function Mapping Report	en
function_employee_mapping_report	Function-Employee Mapping Report	en
sop_employee_mapping_report	SOP-Employee Mapping Report	en
employee_sop_mapping_report	Employee-sop Mapping Report	en
_fail	% Fail	fr
_pass	% De réussite	fr
a	Au Moins	fr
a_asociated	A: zugeordnet ist,	de
a_asociated	A: Associated,	fr
accept	akzeptieren	de
accept	accepter	fr
acceptance	Akzeptanz	de
acceptance	acceptation	fr
activate_desig	Activer Desig	fr
active_depts	Départements actifs	fr
Active Inactive	Actif Inactif	fr
activities_do_not_exist_choose_assign_to_assign_activities	Activités existent pas. Choisissez Affecter pour affecter les activités.	fr
activities_exist_choose_edit_to_update	Activités existent. Choisissez Modifier pour mettre à jour.	fr
activity_included	Activité inclus.	fr
add_certification	Ajouter Certification	fr
add_mappings	Ajouter Mappages	fr
add_new_roles	Ajouter de nouveaux rôles	fr
add_option	Ajouter des Options	fr
add_question	Ajouter une question	fr
add_questions	Ajouter Questions	fr
add_role	Ajouter un rôle	fr
added_succesfully	Added Erfolgreich.	de
added_succesfully	Ajouté avec succès se.	fr
additional_job_responsibilites	Responsabilités d'emploi supplémentaires	fr
additional_links	Liens supplémentaires	fr
additional_permissions	zusätzliche Berechtigungen	de
additional_permissions	autorisations supplémentaires	fr
adhoc_employee_name	Adhoc Employee Name	en
adhoc_employee_name	Adhoc Mitarbeitername	de
adhoc_employee_name	Adhoc Nom de l'employé	fr
adhoc_training	adhoc Ausbildung	de
adhoc_training	Formation Adhoc	fr
adhoc_training_data_uploaded_successfully	Adhoc Training data uploaded successfully.	en
adhoc_training_data_uploaded_successfully	Adhoc Trainingsdaten erfolgreich hochgeladen.	de
adhoc_training_data_uploaded_successfully	Les données de formation Adhoc téléchargés avec succès.	fr
adhoc_training_topic_details_are_created_successfullly	Adhoc training topic details are created successfullly.	en
adhoc_training_topic_details_are_created_successfullly	Adhoc Trainings Thema Details successfullly erstellt.	de
adhoc_training_topic_details_are_created_successfullly	Adhoc sujet de la formation de détails sont créés successfullly.	fr
adhoc_training_topic_is_already_available	Adhoc Training Topic is already available.please try later.	en
adhoc_training_topic_is_already_available	Adhoc Ausbildung Topic bereits available.please später versuchen.	de
adhoc_training_topic_is_already_available	Adhoc Sujet formation est déjà disponible.Veuillez essayer plus tard.	fr
Adhoc Training	Formation Adhoc	fr
Adhoc Training Topic	Adhoc Sujet formation	fr
admin	Administrateur	fr
admin_configuration	Admin Configuration	de
admin_configuration	Configuration Admin	fr
Admin Configuration	Configuration Admin	fr
all_departments	Tous les départements	fr
all_levels	Tous les niveaux	fr
all_resources_permission	Alle Ressourcen Permission	de
all_resources_permission	Toutes les ressources Permission	fr
all_version	All Version	en
alle Schulungen	\N	fr
application_pdf	application / pdf	fr
approval	Zustimmung	de
approval	approbation	fr
Approval	Approbation	fr
approval_sent_for	Approbation Envoyé pour	fr
approval_status_has_been_updated_successfully	Statut d'approbation a été mis à jour avec succès.	fr
approvals	Approbations	fr
approve	Approuver	fr
arms_file_sys	Dateisystempfad	de
arms_file_sys	Localisation du système de fichiers	fr
artwork_files	Artwork-Dateien	de
artwork_files	Fichiers Artwork	fr
artwork_search	Suche	de
artwork_search	recherche	fr
artwork_type	Artwork Type	en
artwork_type	Artwork Type	de
artwork_type	Type d'oeuvre d'art	fr
assign	Assigner	fr
assign_activities	Attribuer Activités	fr
assign_jr	Attribuer JR	fr
assign_roles	Attribuer des rôles	fr
assign_tni	Attribuer TNI	fr
assign_training	Attribuer formation	fr
assigned_date	Datum zugeordnet	de
assigned_date	date de assigné	fr
assigned_roles	Rôles assignés	fr
assignees	Beauftragte	de
assignees	cessionnaires	fr
attandance_for	Attandance pour:	fr
attempt	Tentative	fr
attempts	Attempts	en
attempts	Versuche	de
attempts	tentatives	fr
attendance	Fréquentation	fr
attendance_details_updated_successfully	Attendance details updated Successfully.	en
attendance_details_updated_successfully	Attendance Details erfolgreich aktualisiert.	de
attendance_details_updated_successfully	Les détails des présences à jour avec succès.	fr
attendance_details_uploaded_successfully	Attendance details uploaded Successfully.	en
attendance_details_uploaded_successfully	Attendance Details erfolgreich hochgeladen.	de
attendance_details_uploaded_successfully	Les détails des présences téléchargé avec succès.	fr
attendance_sheet	Anwesenheits	de
attendance_sheet	Feuille De Présence	fr
attendance_successful	Participation réussie ..	fr
attended	besucht	de
attended	Participation	fr
attended_training	Formation assisté	fr
Audit	Audit	fr
authenticate	authentifizieren	de
authenticate	authentifier	fr
authorised_by	Autorisé par	fr
available_activities	Activités disponibles	fr
available_job_responsibilities	Disponible Responsabilités emploi	fr
available_tnis	Disponible TNIS	fr
available_trainings	Formations disponibles	fr
b	questions doivent être fournis!	fr
Bands	Bandes	fr
based_on	Basé sur	fr
bblocked_tests	Tests bloqués	fr
browse_file	Parcourir les fichiers	fr
c	S'il vous plaît fournir atleast	fr
Callibration Schedule	Etalonnage annexe	fr
cams_ip	Server-IP-	de
cams_ip	IP du serveur	fr
cams_password_validity_in_days	Mot de passe Validité en jours	fr
cams_port	Server Port	de
cams_port	Port du serveur	fr
cancel	Annuler	fr
cat1	CAT1	fr
cat2	CAT2	fr
category_created_successfully	Catégorie Créé avec succès.	fr
category_details	Catégorie Détails	fr
category_name	Nom de la catégorie	fr
category.create	Créer une catégorie	fr
category.name	Nom de la catégorie	fr
certification	Bescheinigung	de
certification	certificat	fr
certifications	Certifications	fr
chanage_password	changer le mot de passe	fr
change_control_no	No Control Change	fr
choose_file	Choisissez Fichier:	fr
classroom	Klassenzimmer	de
classroom	salle de classe	fr
Class Room Training	Formation en classe	fr
click_to_edit	Klicken Sie zum Bearbeiten	de
click_to_edit	Cliquez sur pour modifier	fr
closed_extend	Deviated Id	fr
closed_trainings	geschlossene Schulungen	de
closed_trainings	formations fermées	fr
command.add.remove	Ajouter / Supprimer	fr
command.create	Créer	fr
command.remove	Supprimer	fr
command.update	Mettre à jour	fr
comparison	Vergleich...	de
comparison	comparaison	fr
comparison_command	Befehl	de
comparison_command	commandement	fr
comparison_option	Befehl-Wahl-	de
comparison_option	Option commande	fr
comparison_path_separator	Pfadtrenn	de
comparison_path_separator	chemin Separator	fr
comparison_temp_dir	Temporäres Verzeichnis	de
comparison_temp_dir	Répertoire temporaire	fr
completed_status	fertiggestellt	de
completed_status	terminé	fr
compulsory	Obligatoire	fr
compulsory_	[Obligatoire]	fr
Confirm	Confirmer	fr
confirm_dialog	Confirmation Dialog	fr
conform_password	Confirmez Le Mot De Passe	fr
correct_answers	Corriger les réponses	fr
correct_questions	Questions corrects	fr
create	Créer	fr
create_training_for	Créez formation pour	fr
created	Établi	fr
created_by	Erstellt Von	de
created_by	créé Par	fr
created_date	Erstellungs-Datum	de
created_date	date de création	fr
created.	créé.	fr
Create Trainer	Créer formateur	fr
creation	Schöpfung	de
creation	création	fr
creation_edit	Creation / bearbeiten	de
creation_edit	Création / Edition	fr
current	Strom	de
current	courant	fr
current_mapping	Cartographie actuelle	fr
current_password	Mot De Passe Actuel	fr
current_password_should_not_be_same_as_your_previous_3_passwords	Mot de passe actuel ne doit pas être le même que vos trois précédents mots de passe	fr
d	options.	fr
dashboard	Tableau de bord	fr
dashboards	Tableaux de bord	fr
DataUpload	DataUpload	fr
date_duration	Date de Durée	fr
date_time	Date-Time	fr
deact_selected_emps	Désactiver employés sélectionnés	fr
deactivate	Désactiver	fr
deactivate_desig	Désactiver Desig	fr
deactivate_emp	Désactiver Emp	fr
deactivated_by	durch Deaktiviert	de
deactivated_by	par Désactivé	fr
default_permissions	Standardberechtigungen	de
default_permissions	Autorisations par défaut	fr
Department	Département	fr
department_already_exists_with_given_name	Département existe déjà avec le nom donné	fr
department_and_site	Ministère et du site	fr
department_code_visiblity_not_found	Department code Visiblity not found in Admin config.	en
department_code_visiblity_not_found	Abteilungscode Sichtbarkeit nicht im Admin-config	de
department_code_visiblity_not_found	Code Département Visibilité introuvable dans la configuration Administrateur.	fr
department_designation_and_roles	Département Désignation et rôles	fr
department_designation_bands_mapping	Abteilung Bezeichnung Bands Mapping	de
department_designation_bands_mapping	Département Cartographie des bandes de désignation	fr
department_does_not_exixts	Département ne exixts pas.	fr
department_exists_already	Département existe déjà!	fr
department_has_been_created_successfully	Abteilung wurde erfolgreich erstellt.	de
department_has_been_created_successfully	Ministère a été créé avec succès.	fr
Department_has_been_created_successfully	Ministère a été créé avec succès.	fr
department_has_been_updated_successfully	Abteilung wurde erfolgreich aktualisiertgeschlossene Schulungen	de
department_has_been_updated_successfully	Ministère a été mis à jour avec succès	fr
department_not_found	Department not found.	en
department_not_found	Abteilung nicht gefunden.	de
department_not_found	département introuvable	fr
department_pdf	Département:	fr
Department Head	Chef De Département	fr
Department Mapping	Cartographie Département	fr
departments_not_found	Départements introuvables.	fr
deployment	Déploiement	fr
dept	Dept	fr
dept_	DEPT	fr
dept_name	Nom Département	fr
dept.mapng	Départements mappés	fr
dept.search	Département	fr
dept.text	Département	fr
dept.update	Mise à jour Département	fr
dept.view	Voir Département	fr
desg_	DESG	fr
desig.create	Créer Désignation	fr
desig.edit	Modifier Désignation	fr
desig.name	Nom de la désignation	fr
desig.roles	Rôles	fr
desig.search	Recherche Désignation	fr
desig.text	Désignation	fr
desig.view	Voir Désignation	fr
designation_already_exists_with_name	Désignation existe déjà avec le nom	fr
designation_category	Bezeichnung Kategorie	de
designation_category	désignation Catégorie	fr
designation_does_not_exixts	Désignation ne exixts.	fr
designation_has_been_created_successfully	Désignation a été créé avec succès!	fr
designation_mapped_depat	Désignations mappés sur le département	fr
designation_mapping	Bezeichnung Mapping	de
designation_mapping	Mapping Désignation	fr
designation_not_found	Designation not found.	en
designation_not_found	Bezeichnung nicht gefunden.	de
designation_not_found	désignation introuvable	fr
designation_pdf	Désignation:	fr
designation_trainer	Entraîneur Désignation	fr
designation_updated_successfully	Bezeichnung erfolgreich aktualisiert.	de
designation_updated_successfully	Désignation à jour avec succès.	fr
Designation Category	Bezeichnung Kategorie	de
Designation Category	désignation Catégorie	fr
Designation Mapping	Mapping Désignation	fr
designations_not_found	Désignations introuvables.	fr
details	Détails	fr
deviated_id	Deviated Id	fr
deviated_training	Dévié Formations	fr
disapprove	Désapprouver	fr
disapproved	Désapprouvait	fr
discusit_company_details	Discus IT Pvt Ltd conformité Tracker @ 2012	fr
discusit_version_label	Discus IT CAMS v1.0 licence	fr
do_you_want_to_submit_your_test	Do you want to  submit your test?	en
do_you_want_to_submit_your_test	Möchten Sie Ihre Test verfassen?	de
do_you_want_to_submit_your_test	Voulez-vous pour soumettre votre essai?	fr
do_you_want_to_sumbit_your_test	Voulez-vous en envoyant votre test?	fr
document	Dokument	de
document	document	fr
document_not_available	Document non disponible.	fr
document_not_found	Document non trouvé!	fr
document_upload	Téléchargement de documents	fr
documents	Unterlagen	de
documents	documents	fr
download_induction_sheet	Download Induction Sheet	en
download_induction_sheet	Laden Sie Induction Blatt	de
download_induction_sheet	Télécharger induction Sheet	fr
dtc	Abteilung Training Coordinator	de
dtc	formations fermées	fr
duplicate_values	Les valeurs en double!	fr
e_mail	Email	fr
e_mail_id	Email ID.	fr
edit_question	Modifier la question	fr
eff_date	Eff. Date	fr
effective	wirksam	de
effective	efficace	fr
email_	Email:	fr
email_reminder_to_complete_training	Email reminder to complete training will be sent to selected employees.	en
email_reminder_to_complete_training	E-Mail-Erinnerung für absolvieren wird an ausgewählte Mitarbeiter gesendet werden.	de
email_reminder_to_complete_training	Email de rappel pour compléter la formation sera envoyé aux employés sélectionnés.	fr
emp_based_jr	Employé Based JR	fr
emp_code	Emp. Code	fr
emp_mapping	Cartographie des employés	fr
emp_panel	Panel des employés	fr
emp_role_mapping	Role Mapping Emp	fr
emp_signature	Signature De L'Employé	fr
emp_status	Status:	de
emp_status	statut:	fr
emp_working_dept	Les employés qui travaillent dans le département	fr
emp.create	Créer des employés	fr
emp.detail	Détail employé	fr
emp.dob	Date de naissance	fr
emp.doj	Date d'adhésion	fr
emp.edit	Modifier des employés	fr
emp.id	ID	fr
emp.mail	email	fr
emp.map.search	Recherche	fr
emp.map.text	Cartographie des employés	fr
emp.name	Nom de l'employé	fr
emp.search	Recherche employé	fr
emp.surname	Nom de famille	fr
emp.text	\N	fr
emp.view	\N	fr
employe_mapping	Cartographie des employés	fr
Employee	Employé	fr
employee_based_jrutility	Basé employé JrUtility	fr
employee_detail	Détail employé	fr
employee_experience	Expérience des employés	fr
employee_functional_mapping_updated_successfully	Employee functional mapping updated successfully.	en
employee_functional_mapping_updated_successfully	Mitarbeiter Funktionszuordnung erfolgreich aktualisiert.	de
employee_functional_mapping_updated_successfully	Cartographie fonctionnelle des employés mis à jour avec succès.	fr
employee_functional_Mapping_updated_successfully_Error_while_creating_Training	Employee functional Mapping updated successfully.Error while creating Training.Please contact Admin.	en
employee_functional_Mapping_updated_successfully_Error_while_creating_Training	Mitarbeiter funktionale Mapping aktualisiert successfully.Error beim Erstellen Training.Please Kontakt Admin.	de
employee_functional_Mapping_updated_successfully_Error_while_creating_Training	Employé cartographie fonctionnelle jour successfully.Error tout en créant Training.Please contacter Admin.	fr
employee_id	Employee ID	fr
employee_jrs	Employé JR	fr
employee_mapped_with_functional_code_list_found_empty	Employee mapped with functional code list Found Empty.	en
employee_mapped_with_functional_code_list_found_empty	Mitarbeiter mit Funktionscodeliste abgebildet Gefunden Leer.	de
employee_mapped_with_functional_code_list_found_empty	Employé mappé avec la liste de code fonctionnel retrouvé vide.	fr
employee_mapped_with_functional_code_successfully	Employee mapped with functional code successfully.	en
employee_mapped_with_functional_code_successfully	Mit Funktionscode Mitarbeiter erfolgreich zugeordnet.	de
employee_mapped_with_functional_code_successfully	Employé mappée avec le code fonctionnel avec succès.	fr
employee_mapping	Mitarbeiter-Mapping	de
employee_mapping	Cartographie des employés	fr
employee_name	Nom de l'employé	fr
employee_not_found	Employee not found.	en
employee_not_found	Mitarbeiter gefunden.	de
employee_not_found	Employé introuvable.	fr
employee_resignation	Démission de l'employé	fr
employee_sop_mapping_does_not_exist	Mitarbeiter SOP Zuordnung nicht vorhanden.	de
employee_sop_mapping_does_not_exist	Employé à SOP mappage ne pas exister.	fr
employee_transfer	le transfert d'employés	fr
employee.name	\N	fr
employee's_pending_for_SOP_training	Employee's  pending for SOP training	en
employee's_pending_for_SOP_training	Mitarbeiter für SOP Ausbildung anhängig	de
employee's_pending_for_SOP_training	Employé de l'attente pour la formation des SOP	fr
Employee Details	Détails des employés	fr
employees	Les employés	fr
employees_based_on_sop	Les employés Basé sur SOP	fr
employees_based_on_tni	Les employés Basé sur TNI	fr
employees_not_found	Les employés introuvables.	fr
Employee Status	Statut de l'employé	fr
Employee Upload	Employé chargement	fr
end_time	Heure De Fin	fr
end_time_is_clash_with_other_departments	End time is clash with other departments.	en
end_time_is_clash_with_other_departments	Endzeit Zusammenstoß mit anderen Abteilungen	de
end_time_is_clash_with_other_departments	Heure de fin est affrontement avec d'autres ministères	fr
english	Anglais	fr
enter_contact_number	Entrez le numéro de contact.	fr
enter_country	Entrez pays.	fr
enter_department	Entrez Département.	fr
enter_department_and_group	Entrez Département et le Groupe.	fr
enter_email_address	Entrez l'adresse e-mail.	fr
enter_employee_s_last_name	Entrez le nom de l'employé.	fr
enter_group	Entrez groupe.	fr
enter_state	Entrez Etat.	fr
enter_valid_department_name	Entrez le nom du ministère valide!	fr
Equipments	Equipements	fr
error	Erreur.	fr
error_creating_trainer	Erreur de création Trainer.	fr
error_during_saving_data	Erreur lors de la sauvegarde des données!	fr
error_occured	Une erreur est survenue!	fr
error_occured_while_updaing_status	Erreur est survenue lors updaing état!	fr
error_occured_while_updating_SOP_details	Error occured while updating SOP details.	en
error_occured_while_updating_SOP_details	Fehler beim Aktualisieren von SOP Details.	de
error_occured_while_updating_SOP_details	Une erreur est survenue lors de l'actualisation de détails SOP.	fr
error_occured_while_uploading_attendance_details	Error occured while uploading attendance details.	en
error_occured_while_uploading_attendance_details	Fehler beim Hochladen Teilnahme Details.	de
error_occured_while_uploading_attendance_details	Une erreur est survenue lors du téléchargement d'informations de présence.	fr
error_please_try_again_later_or_contact_administrator	Fehler versuchen Sie es später noch einmal oder kontaktieren Sie Administrator.	de
error_please_try_again_later_or_contact_administrator	Erreur s'il vous plaît réessayer plus tard ou contacter l'administrateur.	fr
error_while_assigning	Erreur lors de l'attribution!	fr
error_while_changing_the_status	Error while changing the status	en
error_while_changing_the_status	Fehler beim Ändern des Status	de
error_while_changing_the_status	Erreur lors de la modification du statut	fr
error_while_changing_the_status_for_empId	Error while changing the status for empId:	en
error_while_changing_the_status_for_empId	Fehler beim Ändern des Status für EmpID:	de
error_while_changing_the_status_for_empId	Erreur lors de la modification du statut pour EMPID:	fr
error_while_creating_adhoc_training	Error While Creating Adhoc training.	en
error_while_creating_adhoc_training	Fehler beim Anlegen Adhoc Ausbildung.	de
error_while_creating_adhoc_training	Erreur lors de la création de formation ad hoc.	fr
error_while_creating_attandance	Erreur lors de la création attandance ..	fr
error_while_creating_department	Erreur lors de la création de département.	fr
error_while_creating_desgination	Fehler beim Erstellen desgination	de
error_while_creating_desgination	Erreur lors de la création desgination	fr
error_while_creating_eMployeeFunctional_mapping	Error while Creating EMployeeFunctional Mapping	en
error_while_creating_eMployeeFunctional_mapping	Fehler beim Erstellen von EMployeeFunctional Mapping	de
error_while_creating_eMployeeFunctional_mapping	Erreur lors de la création de cartographie EMployeeFunctional	fr
error_while _creating_function_please_try_again_later	Erreur lors de la création function.Please réessayer plus tard.	fr
Error_While_Creating_HR_Training	Fehler beim Erstellen HR Ausbildung	de
Error_While_Creating_HR_Training	Erreur lors de la création de la formation des ressources humaines	fr
error_while_creating_job_description	Error while creating Job Description	en
error_while_creating_job_description	Fehler beim Anlegen Job Description	de
error_while_creating_job_description	Erreur lors de la création de Description du poste	fr
error_while_creating_Job_description_contact\t	Error while creating Job Description.Please contact Administrator.	en
error_while_creating_Job_description_contact\t	Fehler beim Anlegen Job description.please Kontakt Administrator.	de
error_while_creating_Job_description_contact\t	Erreur lors de la création d'emploi Description.Please administrateur de contact.	fr
error_while_creating_site	Erreur lors de la création du site!	fr
error_while_creating_trainer	Error while creating Trainer	en
error_while_creating_trainer	Fehler beim Erstellen Trainer	de
error_while_creating_trainer	Erreur lors de la création de formateur	fr
error_while_creating_training	Error while creating Training.	en
error_while_creating_training	Fehler beim Erstellen Ausbildung.	de
error_while_creating_training	Erreur lors de la création de la formation.	fr
error_while_creating_training_or_sending_mail	Error while creating Training or sending mail.	en
sheet_upload	Fiche de chargement	fr
error_while_creating_training_or_sending_mail	Fehler beim Erstellen Ausbildung oder das Versenden von E-Mail.	de
error_while_creating_training_or_sending_mail	Erreur lors de la création de la formation ou de l'envoi de courrier.	fr
error_while_employee_deactivating	Fehler beim Deaktivieren Mitarbeiter.	de
error_while_employee_deactivating	Erreur lors de la désactivation de l'employé.	fr
error_while_fetching_function_justification	Error while fetching function justification	en
error_while_fetching_function_justification	Fehler beim Abrufen Funktion Begründung	de
error_while_fetching_function_justification	Erreur lors de l'extraction fonction justification	fr
error_while_job_description_accepted_by_user	Error while Job Description accepted by user	en
error_while_job_description_accepted_by_user	Fehler beim Jobbeschreibung durch den Benutzer akzeptiert	de
error_while_job_description_accepted_by_user	Erreur lors de la Description de l'emploi accepté par l'utilisateur	fr
error_while_mapping_function_code	Error while mapping Function code.No Function code found to be mapped.	en
error_while_mapping_function_code	Fehler beim Mapping-Funktion code.No Funktionscode festgestellt, abgebildet werden.	de
error_while_mapping_function_code	Erreur lors de la cartographie Fonction Code code.No Fonction trouvé d'être mappée.	fr
error_while_mapping_resources	Fehler beim Mapping-Ressourcen.	de
error_while_mapping_resources	Erreur lors de la cartographie des ressources.	fr
error_while_saving_mapping_information	Erreur lors de l'enregistrement des informations de cartographie!	fr
error_while_sending_mail	Erreur lors de l'envoi du courrier.	fr
error_while_SOP_approving	Error while SOP approving!	en
error_while_SOP_approving	Fehler beim SOP Genehmigung!	de
error_while_SOP_approving	Erreur lors de SOP approuvant!	fr
error_while_transferring_employee	Erreur lors du transfert des employés	fr
error_while_updating_approval	Error while updating approval	en
error_while_updating_approval	Fehler beim Aktualisieren Genehmigung	de
error_while_updating_approval	Erreur lors de la mise à jour Approbation	fr
error_while_updating_attendance_sheet	Error while updating attendance sheet!	en
error_while_updating_attendance_sheet	Fehler beim Aktualisieren Anwesenheitsliste!	de
error_while_updating_attendance_sheet	Erreur lors de la mise à jour la feuille de présence!	fr
error_while_updating_department	Fehler beim Aktualisieren Department.	de
error_while_updating_department	Erreur lors de la mise à jour Département.	fr
error_while_updating_designation	Fehler beim Aktualisieren der Bezeichnung.	de
error_while_updating_designation	Erreur lors de la Mise à jour de la désignation.	fr
error_while_updating_document	Erreur lors de la mise à jour du document.	fr
error_while_updating_EMployeeFunctional_mapping	Error while updating EMployeeFunctional Mapping.	en
error_while_updating_EMployeeFunctional_mapping	Fehler beim Aktualisieren EMployeeFunctional Mapping.	de
error_while_updating_EMployeeFunctional_mapping	Erreur lors de la mise à jour EMployeeFunctional Mapping.	fr
error_while_updating_function_justification	Error while updating function justification	en
error_while_updating_function_justification	Fehler beim Aktualisieren-Funktion Begründung	de
error_while_updating_function_justification	Erreur lors de la mise à jour la fonction de justification	fr
error_while_updating_function_mapping_contact	Error while updating Function Mapping.Please try again later or contact Admin.	en
error_while_updating_function_mapping_contact	Fehler beim Aktualisieren Function Mapping.Please es später noch einmal oder kontaktieren Sie Admin versuchen.	de
error_while_updating_function_mapping_contact	Erreur lors de la mise à jour Fonction Mapping.Please réessayer ultérieurement ou contacter l'administrateur.	fr
error_while_updating_hr_training	Error while updating hr training!	en
error_while_updating_hr_training	Fehler beim Aktualisieren hr-Training!	de
error_while_updating_hr_training	Erreur lors de la mise à jour de la formation h!	fr
error_while_updating_job_description\t	Error while updating job description.	en
error_while_updating_job_description\t	Fehler beim Aktualisieren Stellenbeschreibung.	de
error_while_updating_job_description\t	Erreur lors de la mise à jour la description de travail.	fr
error_while_updating_presentation	Erreur lors de la mise à jour de présentation.	fr
error_while_updating_questions	Error while updating questions!	en
error_while_updating_questions	Fehler bei der Aktualisierung Fragen!	de
error_while_updating_questions	Erreur lors de la mise à jour des questions!	fr
error_while_updating_SOP	Error while updating SOP	en
error_while_updating_SOP	Fehler beim Aktualisieren SOP	de
error_while_updating_SOP	Erreur lors de la mise à jour SOP	fr
error_while_uploading_induction_sheet	Error while uploading induction sheet	en
error_while_uploading_induction_sheet	Fehler beim Hochladen Induktionsblatt	de
error_while_uploading_induction_sheet	Erreur lors de l'ajout de la feuille d'induction	fr
error_while_uploading_presenation	Erreur lors du chargement Presenation.	fr
ERROR_WHILE_UPLOADING_SOP	Erreur lors du chargement du SOP:	fr
error_while_uploading_the_final_sop_please_try	Error while uploading the final sop.Please try again later or contact admin.	en
error_while_uploading_the_final_sop_please_try	Fehler beim Hochladen der letzte sop.Please versuchen Sie es später erneut oder kontaktieren Sie admin.	de
error_while_uploading_the_final_sop_please_try	Erreur lors du chargement de la sop.Please finale réessayer plus tard ou contactez administrateur.	fr
error_while_waive-off_training	Error while Waive-off Training!	en
error_while_waive-off_training	Fehler beim Waive-off Training!	de
error_while_waive-off_training	Erreur lors de la formation Waive-off!	fr
error.msg.fax_number	S'il vous plaît entrez 10 chiffres valide Numéro de fax!	fr
error.msg.please_enter_valid_email	S'il vous plaît entrer l'adresse e-mail valide.	fr
show_all	Zeige Alles	de
error.msg.please_enter_valid-10digit_phone_number	S'il vous plaît entrez 10 chiffres du numéro de téléphone valide!	fr
error.msg.please_enter_valid-6digit_pincode	S'il vous plaît entrez 6 chiffres valables Pincode!	fr
error.msg.please_provide_name	S'il vous plaît fournir le nom.	fr
error.msg.please_provide_training	S'il vous plaît Fournir une formation	fr
error.msg.value.required	Le champ ne peut pas être laissé en blanc!	fr
error.msg.value.text	\N	fr
error.msg.value.valid	Les données est invalide!	fr
evaluation	Auswertung	de
evaluation	Évaluation	fr
existing_mapping	Cartographie existante	fr
exp.enter_the_site_to_search	S'il vous plaît entrer sur le site à rechercher!	fr
exp.msg.please_enter_date_gt_effdate	S'il vous plaît entrer une date ultérieure à la date spécifiée comme date d'effet!	fr
exp.please_enter_valid_destination_name	S'il vous plaît fournir le nom de destination valide!	fr
exp.please_provide_empid	\N	fr
exp.please_select_department	S'il vous plaît sélectionnez département.	fr
exp.please_select_site	S'il vous plaît sélectionner un site.	fr
experience	Expérience	fr
experience_trainer	Expérience entraîneur	fr
experience_years	Expérience (en années)	fr
export_to_excel	Exporter vers Excel	fr
field_can_not_be_left_empty	Champ ne peut pas être laissé vide!	fr
file_directory_path	Annuaire Chemin du fichier	fr
final_mapping	Cartographie finale	fr
final_SOP_uploaded_successfully	Final SOP Uploaded Successfully.	en
final_SOP_uploaded_successfully	Schluss SOP erfolgreich hochgeladen.	de
final_SOP_uploaded_successfully	SOP final téléchargé avec succès.	fr
Final SOP Upload	Finale SOP chargement	fr
first_complete_induction_training	Erste vollständige Induktion Ausbildung.	de
first_complete_induction_training	Première compléter induction formation.	fr
first_you_have_to_inactivate_all_department_desig	Zuerst müssen Sie alle Abteilungsbezeichnung und Bands Zuordnung inaktivieren.	de
first_you_have_to_inactivate_all_department_desig	Vous devez d'abord inactiver tous cartographie de désignation et les bandes département.	fr
first_you_have_to_inactivate_all_employee_mapping	Zuerst müssen Sie alle Mitarbeiter Zuordnung inaktivieren.	de
first_you_have_to_inactivate_all_employee_mapping	Vous devez d'abord désactiver la cartographie de tous les employé.	fr
first_you_have_to_inactivate_all_function_and_sop_mapping	Zuerst müssen Sie alle Funktion und sop Zuordnung inaktivieren.	de
first_you_have_to_inactivate_all_function_and_sop_mapping	Vous devez d'abord désactiver toutes les fonctions et la cartographie sop.	fr
first_you_have_to_inactivate_all_mapped_departments_details	Zuerst müssen Sie alle zugeordneten Abteilungen Details zu inaktivieren.	de
first_you_have_to_inactivate_all_mapped_departments_details	Vous devez d'abord inactiver tous les départements de détails mappés.	fr
fix_jrs	Fixer JR	fr
forgot_password	Mot De Passe Oublié	fr
forgot_pwd_qustn	Mot de passe Questions	fr
french	Français	fr
from_date	Von-Datum	de
from_date	Date d'entrée en	fr
Function	Fonction	fr
function_approval_pending_for	Function Approval pending for	en
function_approved_succesfully	Funktion erfolgreich genehmigt.	de
function_approved_succesfully	Fonction approuvé avec succès.	fr
function_code_creation	Funktion Code Creation	de
function_code_creation	Code fonction Création	fr
function_deactivated_successfully	Funktion erfolgreich deaktiviert.	de
function_deactivated_successfully	Fonction désactivée avec succès.	fr
function_details	Funktion Details	de
function_details	Fonction Détails	fr
function_has_been_successfully_mapped	Function has been successfully mapped.	en
function_has_been_successfully_mapped	Funktion erfolgreich abgebildet.	de
function_has_been_successfully_mapped	Fonction a été cartographié avec succès.	fr
function_justification_updated_successfully	Function justification updated successfully.	en
function_justification_updated_successfully	Funktion Rechtfertigung erfolgreich aktualisiert.	de
function_justification_updated_successfully	Fonction justification mis à jour avec succès.	fr
function_mapped_on_ref_doc_no	Funktion auf Ref abgebildet. Doc. Nein.	de
function_mapped_on_ref_doc_no	Fonction mappée sur Ref. Doc. Non.	fr
function_mapping	Function Mapping	de
function_mapping	Cartographie de la fonction	fr
functional	Fonctionnel	fr
functional_JR	JR fonctionnelle	fr
functional_reponsibilities_have_been_assigned	RESPONSABILITÉS fonctionnels ont été assignés.	fr
Function Code Creation	Code fonction Création	fr
Function Mapping	Cartographie de la fonction	fr
g_group	G: Group,	de
g_group	G: Groupe,	fr
general	Général	fr
german	Allemand	fr
group_name	Gruppenname	de
group_name	Nom du groupe	fr
harmonic	Harmonique	fr
harmonise	Harmoniser	fr
head	Tête	fr
head_signature	Chef Signature	fr
head(department/site)	Général (ministère / site)	fr
Head of Department	Chef du Département	fr
hod	HOD	fr
hr	RH	fr
hr_departments	Départements	fr
hr_training_created	RH Formation Créé.	fr
hr_training_created_successfully	HR training created successfully.	en
hr_training_created_successfully	HR Ausbildung erfolgreich erstellt.	de
hr_training_created_successfully	la formation des ressources humaines créé avec succès.	fr
HR_Training_Created_Successfully	HR Ausbildung erfolgreich erstellt.	de
show_all	Montre Tout	fr
HR_Training_Created_Successfully	RH Formation créé avec succès.	fr
hr_training_details_updated_successfully	HR training details updated successfully.	en
hr_training_details_updated_successfully	HR Training Details erfolgreich aktualisiert.	de
hr_training_details_updated_successfully	détails de la formation des ressources humaines mis à jour avec succès.	fr
id	ID	fr
image_file_size_must_be_less_than_2 Mb	la taille du fichier de l'image doit être inférieure à 2 Mb	fr
important	Important	fr
in_active	Dans Active	fr
in_Active	En-Active	fr
in.active	inactif	fr
inactivate	Inaktivieren	de
inactivate	Inactiver	fr
Inactivate	Inaktivieren	de
Inactivate	Inactiver	fr
inactive_functionality	Inaktive Funktionen	de
inactive_functionality	Fonctionnalité Inactif	fr
incorrect_answers	Réponses incorrectes	fr
induction	Induktion	de
induction	Induction	fr
induction_sheet_already_uploaded	Induction sheet already uploaded.	en
induction_sheet_already_uploaded	Induction Blatt bereits hochgeladen.	de
induction_sheet_already_uploaded	feuille de Induction déjà téléchargé.	fr
induction_sheet_uploaded_successfully	Induction sheet uploaded successfully.	en
induction_sheet_uploaded_successfully	Induction Blatt erfolgreich hochgeladen.	de
induction_sheet_uploaded_successfully	feuille de Induction téléchargé avec succès.	fr
induction_training	Formation chargement à induction	fr
induction_training_create	Upload Induktionsnoten	de
induction_training_create	Ajouter à induction Fiche	fr
induction_training_dept	Induction Training Department	de
induction_training_dept	Département de la formation à induction	fr
induction_training_end_time	Induction Training End Time	en
induction_training_end_time	Einarbeitung Endzeit	de
induction_training_end_time	Induction formation End Time	fr
induction_training_is_incomplete_for 	Induction Training is incomplete for 	en
induction_training_is_incomplete_for 	Induction Training ist unvollständig 	de
induction_training_is_incomplete_for 	Induction de formation est incomplète pour 	fr
induction_training_is_incomplete_yet	Induction training is incomplete yet!	en
induction_training_is_incomplete_yet	Induction Training ist noch unvollständig!	de
induction_training_is_incomplete_yet	Induction de formation est incomplète encore	fr
induction_training_mapping	Créer Formation Induction	fr
induction_training_start_time	Induction Training Start Time	en
induction_training_start_time	Einarbeitung Startzeit	de
induction_training_start_time	Induction de formation Start Time	fr
induction_training_view	Ansicht Einarbeitung	de
induction_training_view	Formation Voir Induction	fr
Induction training	Formation Induction	fr
information_has_been_updated	L'information a été mise à jour.	fr
initiate_artwork	Initiieren Artwork	de
initiate_artwork	Initier Création	fr
insert_extended_date	Insérez Extended Date:	fr
Instruments Calibration Matrix	Calibrage Matrice	fr
invalid_time_for_induction_training	Invalid time for induction training.	en
invalid_time_for_induction_training	Ungültige Zeit für Einarbeitung.	de
invalid_time_for_induction_training	Heure invalide pour la formation d'induction.	fr
it_will_be_count_an_attempt	It will be count an attempt for this test. Do you want to close?	en
it_will_be_count_an_attempt	Wird es zählen, einen Versuch für diesen Test. Möchten Sie in der Nähe?	de
it_will_be_count_an_attempt	Il sera compter une tentative pour ce test. Voulez-vous fermer?	fr
item_data	Données	fr
item_report	Rapport	fr
JD_approval	JD Approval	de
JD_approval	JD Approbation	fr
JD_creation	JD Creation	de
JD_creation	JD Création	fr
JD_view_by_version	JD View Von Version	de
JD_view_by_version	JD Vue par Version	fr
job_description_accepted_by_user_successfully	JobDescription accepted by user successfully.	en
job_description_accepted_by_user_successfully	Jobbeschreibung durch den Benutzer erfolgreich angenommen.	de
job_description_accepted_by_user_successfully	Description de l'offre acceptée par l'utilisateur avec succès.	fr
job_description_completed_by_HOD_successfully	Job Description Completed by HOD successfully.	en
job_description_completed_by_HOD_successfully	Job Description von HOD Erfolgreich beendet.	de
job_description_completed_by_HOD_successfully	Description de l'emploi Complété par HOD avec succès.	fr
job_description_created_successfully	Job description created successfully.	en
job_description_created_successfully	Job-Beschreibung erfolgreich erstellt.	de
job_description_created_successfully	Description du poste créé avec succès.	fr
job_description_is_already_available_for_this_employee	Job Description is already available for this employee.	en
job_description_is_already_available_for_this_employee	Stellenbeschreibung ist bereits für diesen Mitarbeiter zur Verfügung.	de
job_description_is_already_available_for_this_employee	Description du poste est déjà disponible pour cet employé.	fr
job_description_not_created_or_not_approved	Job Description nicht oder nicht durch den Leiter der Abteilung genehmigt.	de
job_description_not_created_or_not_approved	Description du poste pas créé ou non approuvé par le chef du département.	fr
job_description_not_found_for_the_employee	JobDescription not found for the employee	en
job_description_not_found_for_the_employee	Jobbeschreibung nicht für den Mitarbeiter gefunden	de
job_description_not_found_for_the_employee	Description de l'offre non trouvé pour le salarié	fr
job_description_status	Job Beschreibung Status	de
job_description_status	Description du poste Etat	fr
job_description_updated_successfully	Job Description Updated Successfully.	en
job_description_updated_successfully	Job Description erfolgreich aktualisiert.	de
job_description_updated_successfully	Description de l'emploi mis à jour.	fr
job_description_uploaded_successfully	Job description uploaded successfully.	en
job_description_uploaded_successfully	Job-Beschreibung erfolgreich hochgeladen.	de
job_description_uploaded_successfully	Description du poste téléchargé avec succès.	fr
jr	JR	fr
jr_mappings	JR Mappages	fr
key	Clé	fr
latest_version	Letzte Version	de
latest_version	Dernière Version	fr
list_of_employees	Liste des Employés	fr
list_of_functional_SOP	Liste des SOP fonctionnelle	fr
list_of_harmonized_SOP	Liste des harmonisé SOP	fr
list_of_presentations	Liste des présentations	fr
list_of_SOPs	Liste des SOP	fr
location:	Localisation:	fr
log_id	Id Connexion	fr
log_out	Abmelden	de
log_out	Se déconnecter	fr
logged_in	Connecté	fr
login	S'identifier	fr
login_audit	Log Audit	de
login_audit	Connexion Audit	fr
login_Error_please_enter_valid_username_and_password	S'il vous plaît entrer nom d'utilisateur et mot de passe.	fr
login_Error_please_enter_valid_username_and_password_along_with_your_site	Erreur de connexion: S'il vous plaît entrer nom d'utilisateur et mot de passe avec votre site	fr
logout	Se Déconnecter	fr
mail_scheduled_day_before_effective_date	Courrier Prévu Day Before Date effective	fr
mail_scheduler	Courrier Scheduler	fr
mail_sent_successfully	Courrier envoyé avec succès.	fr
mail_sent_to_the_selected_employees	Les messages envoyés aux employés sélectionnés.	fr
maintenance_panel	Groupe de Maintenance	fr
mandatory	Verpflichtend	de
mandatory	Obligatoire	fr
Mandatory Training	Formation obligatoire	fr
manual_upload	Manuel chargement	fr
map	Carte	fr
mapped_at	Au mappé	fr
mapped_employees	Les employés mappés	fr
mapped_modules	Zugeordnete Module	de
mapped_modules	Modules mappés	fr
mapped_site_not_found_please_try_again	Mapped Seite nicht gefunden, versuchen Sie es!	de
mapped_site_not_found_please_try_again	Site mappé introuvable, s'il vous plaît essayer de nouveau!	fr
mapped.sites	Sites mappés	fr
mapping	Cartographie	fr
mapping_wise	Cartographie Wise	fr
message	Message	fr
message_can_not_be_empty	Le message ne peut être vide.	fr
message_saved	Message sauvegardé	fr
middle_name	Deuxième Prénom	fr
middleame	Deuxième Prénom	fr
module	Modul	de
module	Module	fr
module_registration	Inscription Module	fr
module_to_map	Modules à la carte	fr
module's_role	\N	fr
Module Registration & Roles	Inscription & Rôles Module	fr
month	Mois	fr
Monthly Reports	Rapports mensuels	fr
msg.dept_created_successfully	Ministère a créé avec succès.	fr
msg.dept_does_not_exist	Département ne existe pas.	fr
msg.desig_created_successfully	Désignation créé avec succès.	fr
msg.desig_does_not_exist	\N	fr
msg.duplicate_entry	Dupliquer l'entrée.	fr
msg.employee_already_mapped	\N	fr
msg.employee_does_not_exist	Ne existe pas employé.	fr
msg.employee_not_mapped_yet	Employée n'a pas encore été cartographié.	fr
msg.employee_record_successfully_created	enregistrement d'Employé créé avec succès.	fr
msg.employee_updated_successfully	dossier de l'employé mis à jour avec succès.	fr
msg.enter_dept_to_search	S'il vous plaît entrer département à rechercher!	fr
msg.enter_site_to_edit	S'il vous plaît entrer dans le site pour être édité.	fr
msg.enter_valid_sitename	S'il vous plaît entrer un nom de site valide.	fr
msg.error	Erreur!	fr
msg.error_try_again	Erreur! Essaye encore.	fr
msg.error_while_updating	\N	fr
msg.mapping_done	La cartographie réalisée.	fr
msg.please_enter_name	\N	fr
msg.please_enter_surname	S'il vous plaît entrez le nom.	fr
msg.please_select_designation	dossier de l'employé mis à jour avec succès.	fr
msg.saved	Saved.	fr
msg.site_created_successfully	Site créé avec succès.	fr
msg.site_does_not_exist	Site ne existe pas.	fr
msp.please_enter_address 	\N	fr
my_jrs	Mes JR	fr
my_tnis	Mes TNIS	fr
My Job Description	Mon Description du poste	fr
My Training	Ma formation	fr
n.a	N / A	fr
new	Nouveau	fr
new_employees	New Employeese	fr
new_mapping	Nouvelle cartographie	fr
new_password	Nouveau Mot De Passe	fr
new_questions	Nouvelles questions	fr
new_recruit_induction	NEW RECRUIT INDUCTION	en
new_recruit_induction	Neuzugang INDUCTION	de
new_recruit_induction	Nouvelle recrue INDUCTION	fr
next	Suivant	fr
no_activities_available_for_selected_category	No activities available for selected category and training type.	en
no_activities_available_for_selected_category	Keine Aktivitäten für ausgewählte Kategorie und Ausbildung Art sind verfügbar.	de
no_activities_available_for_selected_category	Pas d'activités disponibles pour la catégorie sélectionnée et le type de formation.	fr
no_activities_available_for_selected_category_and_training_type	\N	fr
no_adhoc_training_found	No adhoc training found.	en
no_adhoc_training_found	Kein adhoc Ausbildung gefunden.	de
no_adhoc_training_found	Aucune formation ad hoc trouvé.	fr
no_available_jr	Pas de JR Disponible!	fr
no_categories_available_please_enter_category_first	Aucune catégorie disponible. S'il vous plaît Entrez Première Catégorie.	fr
no_category_exist	Sans catégorie existe.	fr
no_category_exists	Aucune catégorie existe	fr
no_closed_training_found	Keine geschlossenen Ausbildung gefunden.	de
no_closed_training_found	Aucune formation fermé trouvé.	fr
no_completed_training_found	No completed training found.	en
no_completed_training_found	Keine abgeschlossene Ausbildung gefunden.	de
no_completed_training_found	Aucune formation terminée trouvé.	fr
no_current_version_of_funtion	No current version of funtion mapping found for employee	en
no_current_version_of_funtion	Keine aktuelle Version des funtion Mapping für Mitarbeiter gefunden	de
no_current_version_of_funtion	Aucune version actuelle de cartographie funtion trouvé employé	fr
no_departments_available_for_selected_site	Aucun Départements Disponible pour site sélectionné.	fr
no_designations_found	Keine Bezeichnungen gefunden.	de
no_designations_found	Aucun Désignations trouvés.	fr
no_designations_mapped_to_selected_group	Aucun Désignations mappés au groupe sélectionné.	fr
no_document_found_for_view	Kein Dokument gefunden Für View.	de
no_document_found_for_view	Aucun document trouvé Pour View.	fr
no_employee_available_for_selected_training	Aucun employé disponible pour la formation sélectionnée.	fr
no_employee_details_found	Kein Mitarbeiter Gefunden.	de
no_employee_details_found	Non Détails employés Trouvé.	fr
no_employee_found	No employee found.	en
no_employee_found	Kein Mitarbeiter gefunden.	de
no_employee_found	Aucun employé.	fr
no_employee_found_for_selected_department_and_designation_mapping	Kein Mitarbeiter für ausgewählte Abteilung und Bezeichnung Zuordnung gefunden.	de
no_employee_found_for_selected_department_and_designation_mapping	Aucun employé trouvé pour sélectionné département et la cartographie de désignation.	fr
no_employee_found_for_selected_function_code	Kein Mitarbeiter für ausgewählte Funktionscode gefunden.	de
no_employee_found_for_selected_function_code	Aucun employé pour sélectionné le code de fonction.	fr
no_employee_found_for_test	Kein Mitarbeiter gefunden für Test.	de
no_employee_found_for_test	Aucun employé pour le test.	fr
no_employee_trainings_found	No employee trainings found.	en
no_employee_trainings_found	Keine Mitarbeiterschulungen gefunden.	de
no_employee_trainings_found	Pas de formations des employés trouvés.	fr
no_employees_for_selected_department	Aucun des employés pour le ministère sélectionnée.	fr
no_employees_for_selected_training	Aucun des employés pour la formation sélectionnée.	fr
no_empty	Keine leeren	de
no_empty	Pas de vide	fr
no_function_justification_found_for_the_employee	No Function justification found for the employee.	en
no_function_justification_found_for_the_employee	Nein Funktion Rechtfertigung für die Mitarbeiter gefunden.	de
no_function_justification_found_for_the_employee	Aucune justification Fonction trouvé pour l'employé.	fr
no_function_pending_for_approval	Keine Funktion anhängigen zur Genehmigung vor.	de
no_function_pending_for_approval	Pas de fonction en attente d'approbation.	fr
no_functional_activities_mapped_at_the_moment	Pas activités fonctionnelles mappés pour le moment.	fr
no_harmonized_activities_mapped_at_the_moment	Aucun Activités harmonisées mappés pour le moment.	fr
no_job_description_pending_for_approval	Keine Stellenbeschreibung für die Zulassung anhängig.	de
no_job_description_pending_for_approval	Aucune description de travail en attente d'approbation.	fr
no_jr_is_selected	Pas de JR est sélectionnée!	fr
no_justification_found	No Justification Found.	en
no_justification_found	Keine Begründung gefunden.	de
no_justification_found	Pas de Justification Trouvé.	fr
no_of_option	Pas d'options	fr
no_presentation_is_available	Pas de présentation est disponible.	fr
no_record_found	Aucun Enregistrement Trouvé.	fr
no_SOP_details_found	No SOP details found!	en
no_SOP_details_found	Keine SOP Details gefunden!	de
no_SOP_details_found	Aucun détail SOP trouvé!	fr
no_sop_found_for_seleceted_employee	Kein SOP Gefunden Für Seleceted Mitarbeiter.	de
no_sop_found_for_seleceted_employee	Aucune SOP Trouvé Pour Seleceted employés.	fr
no_SOP_linked_to_the_function_code	No SOP linked to the function code.	en
no_SOP_linked_to_the_function_code	Kein SOP dem Funktionscode verknüpft.	de
no_SOP_linked_to_the_function_code	N SOP lié au code de fonction.	fr
no_sop_pending_for_approval	Keine anstehenden SOP zur Genehmigung vor.	de
no_sop_pending_for_approval	Aucune SOP attente pour approbation.	fr
no_such_training_found_training_date_may_have_been_expired_or_no_training_has_been_created_yet	Aucune formation trouvé! date de la formation peut avoir été expiré ou aucune formation n'a encore été créé.	fr
no_test_found_for_selected_ref_doc_no	Kein Test für ausgewählte Ref gefunden. Doc. Nein.	de
no_test_found_for_selected_ref_doc_no	Aucun test trouvé pour sélectionnés Réf. Doc. Non.	fr
no_tests_found	Aucun test trouvé!	fr
no_tnis_found	Aucun TNIS trouvé.	fr
no_trainer_available	Aucune formateur Disponible!	fr
no_trainer_found	Aucune formateur trouvé ..	fr
no_training_found_for_selected_ref_doc_no	Kein Training für ausgewählte RefDocNo gefunden.	de
no_training_found_for_selected_ref_doc_no	Aucune formation trouvé pour RefDocNo sélectionnée.	fr
no_trainings_available	Pas de formations disponibles.	fr
no_trainings_found_for_selected_employee	No trainings found for selected employee.	en
sops_uploaded_successfully	\N	fr
no_trainings_found_for_selected_employee	Keine Schulungen für ausgewählte Mitarbeiter gefunden.	de
no_trainings_found_for_selected_employee	Pas de formations trouvé pour employé sélectionné.	fr
no_uploaded_attendance_sheet_found	Keine hochgeladenen Anwesenheits gefunden	de
no_uploaded_attendance_sheet_found	Pas de feuille de présence téléchargé trouvé	fr
primary_id	Primäre Id	de
not_defined	Non défini	fr
notice	Avis	fr
notice_board	Tableau D'Affichage	fr
notice_has_been_saved_successfully	Avis a été enregistré avec succès.	fr
number_of_employees	Nombre D'Employés	fr
number_of_questions	Nombre de questions	fr
only_hod_can_view_this_page	Seulement HOD peut voir cette page.	fr
organization	Organisation	fr
organization_and_designation	Organisation et Désignation	fr
orientation_andinduction_training	ORIENTATION ET FORMATION D'ADMISSION RECORD	fr
p_personal	P: Personal,	de
p_personal	P: Personnel,	fr
pass_fail	Pass / Fail	de
pass_fail	Pass / Fail	fr
password	Mot de passe	fr
password_has_been_changed_successfully	Mot de passe a été changé avec succès.	fr
password_is_wrong	Mot de passe est erroné!	fr
password_validity_in_days	Mot de passe Validité en jours	fr
passwords_do_not_match	Nouveau et confirmez le mot de passe sont ne correspond pas!	fr
password should contain at least one special character and one number	Mot de passe doit contenir au moins un caractère spécial et un chiffre.	fr
pdf_compare	Proof Reader	de
pdf_compare	Proof Reader	fr
pending_SOP_trainings	Attente SOP Formations	fr
pending_tni_trainings	En attendant TNI Formations	fr
pending_trainings	Formations en attente	fr
percentage_%	Prozentual%	de
percentage_%	Pourcentage%	fr
percentage(%)	Prozent (%)	de
percentage(%)	Pourcentage (%)	fr
permission_have_been_assigned_successfully	Permission ont été attribuées avec succès.	fr
permissions	Autorisations	fr
Permissions	Autorisations	fr
phone_and_email	Téléphone et E-mail	fr
phone_no	Pas De Téléphone.	fr
please_add_reason_for_the_change	S'il vous plaît ajouter raison de ce changement.	fr
please_assgin_employee_for_the_training	S'il vous plaît Assgin employés pour la formation.	fr
please_change_sop_mapping	Bitte ändern SOP Mapping von SOP-Management.	de
please_change_sop_mapping	S'il vous plaît Changer SOP Cartographie de la Gestion des SOP.	fr
please_confirm_the_password	S'il vous plaît fournir le mot de passe de confirmation.	fr
please_enter_a_valid_userid_and_password	Please enter a valid userid and password	en
please_enter_a_valid_userid_and_password	Geben Sie eine gültige Benutzer-ID und das Passwort	de
please_enter_a_valid_userid_and_password	S'il vous plaît entrer un nom d'utilisateur et mot de passe	fr
please_enter_a_valid_userid_and_password_and_comment	Geben Sie eine gültige Benutzer-ID und das Kennwort und Kommentar	de
please_enter_a_valid_userid_and_password_and_comment	S'il vous plaît entrer un nom d'utilisateur et mot de passe et de commentaires	fr
please_enter_description	S'il vous plaît entrer description.	fr
please_enter_employee_passfail_percentage	Bitte geben Sie an Arbeitnehmer Passfail Prozent	de
please_enter_employee_passfail_percentage	S'il vous plaît Entrez employés Passfail Pourcentage	fr
please_enter_item_id	Bitte geben Sie Artikel-Nummer.	de
please_enter_item_id	S'il vous plaît entrer Item Id.	fr
please_enter_numeric_value_between_0-6	S'il vous plaît Entrer une valeur numérique entre 0-6	fr
please_enter_only_numeric_values_for_pincode	S'il vous plaît mettez seulement des valeurs numériques pour Pincode.	fr
please_enter_percentage_of_employee_id	Bitte geben Prozentsatz der Mitarbeiter-ID	de
please_enter_percentage_of_employee_id	S'il vous plaît entrer pourcentage des employés Id	fr
please_enter_primary_id	Bitte geben Sie Primary Id.	de
please_enter_primary_id	S'il vous plaît entrer Id primaire.	fr
please_enter_score	Bitte geben Punktzahl.	de
please_enter_score	S'il vous plaît entrer score.	fr
please_enter_the_comments_which_will_be_used_to_close_all_active_training	Bitte geben Sie den Bemerkungen, die verwendet werden, um alle aktiven Trainings zu schließen und inaktivieren diese Mitarbeiter werden wird. Um aktuelle offene Trainings zu sehen, klicken Sie bitte auf Ansicht Trainings.	de
please_enter_the_comments_which_will_be_used_to_close_all_active_training	S'il vous plaît entrer les commentaires qui seront utilisés pour fermer toutes les formations actives et inactiver cet employé. Pour voir formations ouvertes actuelles s'il vous plaît cliquer sur Afficher les Formations.	fr
please_enter_title	S'il vous plaît entrer le titre.	fr
please_enter_trainer_name	Bitte geben Sie Trainer Namen.	de
please_enter_trainer_name	S'il vous plaît entrez le nom du formateur.	fr
please_enter_training_topic	Bitte geben Sie Trainings Topic.	de
please_enter_training_topic	S'il vous plaît Entrez Sujet de la formation.	fr
please_enter_valid_value	Bitte geben Sie eine gültige Wert.	de
please_enter_valid_value	S'il vous plaît saisir une valeur correcte.	fr
please_enter_values	Bitte Geben Sie Werte.	de
please_enter_values	S'il vous plaît entrer des valeurs.	fr
please_fill_category_name	S'il vous plaît Remplissez Nom de la catégorie.	fr
please_find_ref_doc_no	Finden Sie Ref. Doc. Nein.	de
please_find_ref_doc_no	S'il vous plaît trouver Réf. Doc. Non.	fr
please_first_deactivate_or_change_designation	Bitte zuerst deaktivieren oder Bezeichnung aller Mitarbeiter, die auf ausgewählten Abteilung und Bezeichnung zugeordnet sind.	de
please_first_deactivate_or_change_designation	S'il vous plaît d'abord désactiver ou changer la désignation de tous les employés qui sont mappés sur sélectionné département et la désignation.	fr
please_have_some_valid_values	S'il vous plaît avoir des valeurs valides.	fr
please_insert_a_valid_description	S'il vous plaît Insérez une description valide.	fr
please_insert_presentation_name	S'il vous plaît entrez le nom de présentation.	fr
please_map_atleast_one_employee	Bitte Karte atleast einem Mitarbeiter.	de
please_map_atleast_one_employee	S'il vous plaît carte atleast un employé.	fr
please_map_department_to_atleast_one_site	S'il vous plaît carte ministère de atleast un seul site.	fr
please_map_document_to_atleast_on_site	S'il vous plaît carte document à atleast sur place.	fr
please_provd_valid_email	S'il vous plaît fournir adddress email valide.	fr
please_provide_a_name_for_category	S'il vous plaît fournir un nom pour Catégorie.	fr
please_provide_a_short_title_Maximum_100_chars	S'il vous plaît donner un titre court. (Maximum 100 caractères).	fr
please_provide_a_value_or_remove_the_field	S'il vous plaît fournir une valeur ou supprimer le champ!	fr
please_provide_current_password	S'il vous plaît fournir le mot de passe actuel.	fr
please_provide_designation	S'il vous plaît fournir Désignation.	fr
please_provide_document_name	S'il vous plaît fournir le nom de document.	fr
please_provide_email	S'il vous plaît fournir des email.	fr
please_provide_end_time_for_training	S'il vous plaît fournir l'heure de fin pour la formation!	fr
please_provide_experience	S'il vous plaît fournir une expérience.	fr
please_provide_experience_in_years_in_number	S'il vous plaît fournir une expérience (en années) en nombre.	fr
please_provide_id	S'il vous plaît fournir des ID.	fr
please_provide_jr_designation	S'il vous plaît fournir des JR / Désignation	fr
please_provide_mapping_for_sop	S'il vous plaît fournir des cartes pour les SOP	fr
please_provide_name_id	S'il vous plaît fournir Nom / ID	fr
please_provide_new_password	S'il vous plaît fournir nouveau mot de passe.	fr
please_provide_options_in_question	S'il vous plaît fournir des options en question.	fr
please_provide_organization	S'il vous plaît fournir Organisation.	fr
please_provide_password	S'il vous plaît fournir un mot de passe.	fr
please_provide_path_for_employee_trainings_data	Please Provide Path for Employee Trainings Data.	en
please_provide_path_for_employee_trainings_data	Bitte geben Sie Pfad für Mitarbeiterschulungen Daten.	de
please_provide_path_for_employee_trainings_data	S'il vous plaît fournir Chemin pour les formations des employés des données.	fr
please_provide_phone_no	S'il vous plaît fournir pas de téléphone.	fr
please_provide_question	S'il vous plaît fournir question.	fr
Please_provide_reason_for_change	Bitte geben Grund für den Wandel.	de
Please_provide_reason_for_change	S'il vous plaît fournir la raison du changement.	fr
please_provide_refernce_doc_no	S'il vous plaît fournir refernce Doc. Non.	fr
please_provide_revision_no	S'il vous plaît fournir No. Révision	fr
please_provide_start_time_for_training	S'il vous plaît fournir Heure de début pour la formation!	fr
please_provide_subcategory_name	S'il vous plaît fournir le nom Sous-catégorie.	fr
please_provide_surname	S'il vous plaît fournir le nom.	fr
please_provide_the_regeneration_period	Please provide the regeneration period.	en
please_provide_the_regeneration_period	Bitte geben Sie die Regenerationszeit.	de
please_provide_the_regeneration_period	S'il vous plaît fournir la période de régénération.	fr
please_provide_the_regeneration_period_betweeen_1_to	Please provide regeneration period between 1 to	en
please_provide_the_regeneration_period_betweeen_1_to	Bitte Regenerationszeit zwischen 1 bis	de
please_provide_the_regeneration_period_betweeen_1_to	S'il vous plaît fournir période de régénération entre 1 à	fr
please_provide_username	S'il vous plaît fournir le nom d'utilisateur.	fr
please_provide_valid_employee_details	Please provide valid employee details.	en
please_provide_valid_employee_details	Bitte geben Sie gültigen Mitarbeiterdetails.	de
please_provide_valid_employee_details	S'il vous plaît fournir des informations sur les employés valides.	fr
please_provide_valid_password	S'il vous plaît fournir un mot de passe valide.	fr
please_provide_valid_password_not_last_3	S'il vous plaît fournir un mot de passe valide pas duré 3 mot de passe.	fr
please_provide_valid_SOP_details	Please provide valid SOP details.	en
please_provide_valid_SOP_details	Bitte geben Sie gültige SOP Details.	de
please_provide_valid_SOP_details	S'il vous plaît fournir les détails de SOP valides.	fr
please_provide_value_for	Bitte geben Sie Wert für	de
please_provide_value_for	S'il vous plaît fournir une valeur pour	fr
please_save_password	S'il vous plaît enregistrer le mot de passe:	fr
please_search_the_employee_for_trainer	Bitte suchen Sie den Mitarbeiter für die Trainer.	de
please_search_the_employee_for_trainer	S'il vous plaît chercher l'employé pour l'entraîneur.	fr
Please_select_a_date_for_which_the_attendance_sheet_is_uploaded	Bitte wählen Sie ein Datum, für das die Anwesenheitsanbringung	de
Please_select_a_date_for_which_the_attendance_sheet_is_uploaded	S'il vous plaît sélectionner une date pour laquelle la feuille de présence est téléchargé	fr
please_select_a_designation	S'il vous plaît sélectionner une désignation.	fr
please_select_a_file	S'il vous plaît Sélectionnez un fichier .:	fr
please_select_a_message	S'il vous plaît sélectionner un message!	fr
please_select_a_module	Bitte wählen Sie ein Modul.	de
please_select_a_module	S'il vous plaît sélectionner un module.	fr
please_select_a_resource_to_map	Bitte wählen Sie eine Ressource auf der Karte.	de
please_select_a_resource_to_map	S'il vous plaît sélectionner une ressource à la carte.	fr
please_select_a_role	S'il vous plaît sélectionner un rôle.	fr
please_select_a_role_to_be_deleted	S'il vous plaît sélectionner un rôle à supprimer.	fr
please_select_a_sop_to_search	Bitte wählen Sie ein SOP Suche gehen.	de
please_select_a_sop_to_search	S'il vous plaît sélectionner un SOP pour la recherche.	fr
please_select_a_start_time	Please select a start time	en
please_select_a_start_time	Bitte wählen Sie eine Startzeit	de
please_select_a_start_time	S'il vous plaît sélectionner une heure de début	fr
please_select_a_subCategory	S'il vous plaît Sélectionnez une sous-catégorie.	fr
please_select_a_to_date_which_comes_after_the_from_date	Please select a To date which comes after the From date.	en
please_select_a_to_date_which_comes_after_the_from_date	S'il vous plaît choisir une date Pour qui vient après la date à partir.	fr
please_select_a_to_date_which_comes_after_the_from_date	Bitte wählen Sie ein Datum, um die nach dem Von-Datum kommt.	de
please_select_a_valid_department_and _dont_edit_the_given_name	S'il vous plaît sélectionner un ministère valide et Dont Modifier le nom donné.	fr
please_select_a_valid_group	S'il vous plaît Sélectionnez un groupe valide.	fr
please_select_a_valid_ref_doc_no.	S'il vous plaît sélectionner un valide Réf n ° doc	fr
please_select_a_valid_role	\N	fr
please_select_a_valid_site	S'il vous plaît Sélectionner un site valide.	fr
please_select_a_valid_site_for_login	S'il vous plaît sélectionner un site valable pour le login!	fr
please_select_a_valid_trainer	S'il vous plaît sélectionner un formateur valide.	fr
please_select_a_valid_trainer_value	S'il vous plaît sélectionner un formateur valeur valide.	fr
please_select_a_valid_training	S'il vous plaît sélectionner une formation valide!	fr
previous_roles	Rôles Précédente	fr
please_select_appropriate_designation	please_select_appropriate_designation.	fr
please_select_atleast_one_activity	S'il vous plaît sélectionner au moins une activité!	fr
please_select_atleast_one_permission	S'il vous plaît sélectionner au moins un Permission.	fr
please_select_atleast_one_tni	S'il vous plaît sélectionner au moins un TNI!	fr
please_select_atleast_one_training	Please select atleast one training.	en
please_select_category_and_subCategory_to_edit_questions	S'il vous plaît choisissez la catégorie et sous-catégorie à modifier des questions.	fr
please_select_category_and_subCategory_to_view_uploaded_files	S'il vous plaît choisir une catégorie et sous-catégorie pour afficher les fichiers Téléchargée.	fr
please_select_category_name	S'il vous plaît Sélectionnez Nom de la catégorie.	fr
please_select_date	Bitte wählen Sie Datum.	de
please_select_date	S'il vous plaît sélectionner date.	fr
Please_select_date_after_the_joining_date	Bitte wählen Sie Datum nach dem Fügedatum	de
Please_select_date_after_the_joining_date	S'il vous plaît sélectionner une date après la date rejoindre	fr
please_select_department_coordinator 	Bitte wählen Sie Abteilung Koordinator Mitarbeiter-ID.	de
please_select_department_coordinator 	S'il vous plaît sélectionner employés Coordonnateur Département Id.	fr
please_select_department_name.	Bitte wählen Abteilungsnamen.	de
please_select_department_name.	S'il vous plaît sélectionnez département Nom.	fr
please_select_department_to_map_the_presentation	S'il vous plaît Sélectionnez Ministère de Plan de la présentation.	fr
please_select_designation_to_map_the_presentation	S'il vous plaît Sélectionnez Désignation de Plan de la présentation.	fr
please_select_end_time	Please select end time	en
please_select_end_time	Bitte wählen Sie die Endzeit	de
please_select_end_time	S'il vous plaît sélectionnez l'heure de fin	fr
please_select_end_time_after_the_start_time	Bitte wählen Sie die Endzeit nach der Startzeit.	de
please_select_end_time_after_the_start_time	S'il vous plaît sélectionnez l'heure de fin après l'heure de début.	fr
please_select_from_date	Bitte wählen Von Datum.	de
please_select_from_date	S'il vous plaît Sélectionnez De date.	fr
please_select_language	Langue	fr
please_select_reference_document_number	S'il vous plaît Sélectionnez Numéro de référence du document.	fr
please_select_salutation	S'il vous plaît sélectionnez Salutation.	fr
please_select_site	S'il vous plaît Choisissez Site.	fr
please_select_site_to_login	Sélectionnez Site	fr
please_select_site_to_map_the_presentation	S'il vous plaît Choisissez Site à Plan de la présentation.	fr
please_select_some_trainer	S'il vous plaît Sélectionnez Certains Trainer.	fr
please_select_SOP	S'il vous plaît sélectionnez SOP.	fr
please_select_the_employee	S'il vous plaît sélectionnez l'employé!	fr
please_select_the_entity_name	Bitte wählen Sie den Elementnamen.	de
please_select_the_entity_name	S'il vous plaît sélectionner l'entité Nom.	fr
please_select_the_test	S'il vous plaît sélectionner le test.	fr
please_select_to_date	Bitte wählen bis Datum.	de
please_select_to_date	S'il vous plaît Sélectionnez la date.	fr
please_select_trainer_name	Bitte wählen Sie Trainer Namen.	de
please_select_trainer_name	S'il vous plaît sélectionnez le nom de formateur.	fr
please_select_trainer_type	S'il vous plaît Sélectionnez Type de formateur.	fr
please_select_training_category	S'il vous plaît Sélectionnez Formation Catégorie.	fr
please_select_training_date	Bitte wählen Sie Trainingsdatum	de
please_select_training_date	S'il vous plaît sélectionner la date de formation	fr
please_select_training_end_time	Bitte wählen Trainings Endzeit	de
please_select_training_end_time	S'il vous plaît Sélectionnez l'heure de fin de formation	fr
please_select_training_start_time	Bitte wählen Sie Trainingszeit starten	de
please_select_training_start_time	S'il vous plaît sélectionnez Formation commencer Temps	fr
please_select_Training_topic	Bitte wählen Sie Thema der Schulung	de
please_select_Training_topic	S'il vous plaît sélectionner le sujet de la formation	fr
please_select_training_type	S'il vous plaît Sélectionner le type de formation.	fr
please_select_type_of_training	S'il vous plaît sélectionner le type de formation.	fr
please_specify_phoneNumber_for_the_employee	S'il vous plaît spécifier PhoneNumber pour l'employé.	fr
please_specify_right_details	S'il vous plaît spécifier les détails droite.	fr
please_specify_training_regeneration_period	Please specify training regeneration period in number of months i.e. 01 to 	en
please_specify_training_regeneration_period	Bitte geben Sie die Regeneration Ausbildungszeit in Anzahl der Monate, dh 01 bis	de
please_specify_training_regeneration_period	S'il vous plaît spécifier la formation période de régénération en nombre de mois-à-dire 01 à	fr
please_specify_weekly_day_scheduler(in days)	S'il vous plaît spécifier planificateur de jour de repos hebdomadaire (en jours).	fr
please_upload_attendance_sheet	Bitte laden Sie Anwesenheitsliste.	de
please_upload_attendance_sheet	S'il vous plaît Ajouter Feuille de présence.	fr
please_upload_induction_sheet_no_induction_sheet_found	Please upload induction sheet.No induction sheet found!	en
please_upload_induction_sheet_no_induction_sheet_found	Bitte laden Induktions sheet.No Induktions Blatt gefunden!	de
please_upload_induction_sheet_no_induction_sheet_found	S'il vous plaît télécharger induction feuille d'induction sheet.No trouvé!	fr
please_upload_only_pdf_documents	Bitte laden Sie nur PDF-Dokumente.	de
please_upload_only_pdf_documents	S'il vous plaît télécharger uniquement les documents pdf.	fr
please_upload_questions	Bitte laden Fragen.	de
please_upload_questions	S'il vous plaît télécharger questions.	fr
please_upload_trainer_certificate	Bitte laden Sie Trainer-Zertifikat.	de
please_upload_trainer_certificate	S'il vous plaît télécharger le certificat de formateur.	fr
please_waive-off_the_training	Please Waive-off the training.	en
please_waive-off_the_training	Bitte Verzichten-off der Ausbildung.	de
please_waive-off_the_training	S'il vous plaît Renoncer-off de la formation.	fr
PM Schedule	PM Horaires	fr
present	Présent	fr
presentation	Présentation	fr
presentation_description	Présentation description	fr
presentation_exist_for_this_subCategory_please_go_to_edit	Présentation existent pour cette SubCategory.Please aller à éditer.	fr
presentation_name	Presentaion Nom	fr
presentation_not_found	Présentation non trouvé!	fr
presentation_test	Présentation test	fr
presentation_trainings_attended	Présentation Formations assisté	fr
presentation_upload	Présentation chargement	fr
presentation_uploaded_succesfully	Présentation Téléchargée avec succès se.	fr
presentations_based_on	Présentations sur la base	fr
presentations_dont_exist_please_insert_a_presentation	Présentations Dont exist.Please insérer une présentation.	fr
previous	Précédent	fr
previous_mapping	Cartographie précédente	fr
primary_id	Id primaire	fr
process_done_successfully	Verfahren erfolgreich durchgeführt.	de
process_done_successfully	Procédé fait avec succès.	fr
profile	Profile	en
profile	Profil	de
profile	profil	fr
provide_path_details_for_emp	Fournir chemin pour Détails employés	fr
provide_path_for_sop	Fournir chemin pour Sops	fr
q_	Q.	fr
QA_training	Systèmes AQ	fr
question	Question	fr
question_document	Frage Document	de
question_document	Question document	fr
questions	Questions	fr
questions_added	Questions Ajoutés:	fr
questions_added_0	Questions Ajoutés: 0	fr
re_training_generation	Umschulung Erstellung	de
re_training_generation	Re-Generation Formation	fr
read_acknowledge	Lisez-Reconnaissez	fr
read_and_acknowledge	Lire et Reconnaissez	fr
reason_for_change	Raison du changement	fr
received_by	Reçu Par	fr
record_already_added	Enregistrez déjà ajouté!	fr
ref_doc	Ref.Doc.	fr
ref_doc_no_mapped_on_function	Ref. Doc. Kein auf Funktion zugeordnet	de
ref_doc_no_mapped_on_function	Ref. Doc. Non mappé sur Fonction	fr
refdocno_with_this_revision_number_is_already_exists	RefDocNo with this Revision Number is already exists!	en
refdocno_with_this_revision_number_is_already_exists	RefDocNo mit dieser Revisionsnummer ist bereits vorhanden!	de
refdocno_with_this_revision_number_is_already_exists	RefDocNo avec ce numéro de révision est existe déjà!	fr
reference_doc_no	Référence Doc. Non.	fr
reference_document_no	Document de référence Non	fr
regulatory_training	Formation réglementaire	fr
reload	Recharger	fr
remark	Bemerkung	de
remark	Remarque	fr
remove_function_mapping	Entfernen Function Mapping	de
remove_function_mapping	Retirer mappage de fonction	fr
remove_mappings	Retirer Mappages	fr
remove_question	Retirer question	fr
removed_mapping	Cartographie retiré	fr
replace	Remplacer	fr
Report	Bericht	de
Report	Rapport	fr
report_pdf	Report.pdf	fr
reporting_manager_name	Reporting Manager Name	de
reporting_manager_name	Nom de rapports Manager	fr
reports	Rapports	fr
reset	Remettre	fr
Resign	démissionner	fr
resources_mapped_successfully_with_modules_and_roles	Ressourcen Erfolgreich mit Modulen und Rollen abgebildet.	de
resources_mapped_successfully_with_modules_and_roles	Ressources réussi à cartographier avec des modules et des rôles.	fr
response_date	Date de réponse	fr
result_lower	Ergebnis	de
result_lower	Résultat	fr
retest	Retest	fr
review_confirm	Revue & Confirmer	fr
review_sop_function_mappings	Revue SOP mappages de fonction	fr
role	Rôle	fr
role_has_already_been_assigned	Rôle a déjà été attribué.	fr
roles	Rôles	fr
roles_permissions	Rollen Berechtigungen	de
roles_permissions	Rôles Permission	fr
Roles & Permissions	Rôles et autorisations	fr
rsr.approvals	Approbations	fr
rsr.assign.jr	Attribuer JR	fr
rsr.assign.tni	Attribuer TNI	fr
rsr.attendanc	Fréquentation	fr
rsr.department	Département	fr
rsr.designation	Désignation	fr
rsr.designation.group	Désignation Groupe	fr
rsr.document.upload	Téléchargement de documents	fr
rsr.employe.based.jr	Employé Based JR	fr
rsr.employee	Employé	fr
rsr.employee.dashboard	EmployeeDashboard	fr
rsr.employee.transfer	le transfert d'employés	fr
rsr.head.dashboard	Dashboard Head	fr
rsr.hr.training	RH Formation	fr
rsr.my.jrs	Mes JR	fr
rsr.my.tnis	Mes TNIS	fr
rsr.notice	Avis	fr
rsr.permission.tabs	Onglets d'autorisation	fr
rsr.permissions	Autorisations	fr
rsr.presentation.test	Présentation test	fr
rsr.presentation.test.details	Présentation Détails du test	fr
rsr.presentation Upload	Présentation chargement	fr
rsr.site	Site	fr
rsr.SOP.category	SOP Catégorie	fr
rsr.sop.sheet.upload	SOP Fiche chargement	fr
rsr.test	Test	fr
rsr.test.details	Détails du test	fr
rsr.tnicategory	TNICategory	fr
rsr.tniSubCategory	TNISubCategory	fr
rsr.trainer	Entraîneur	fr
rsr.training	Formation	fr
rsr.view.jr	Voir JR	fr
rsr.view.presentations	Voir les présentations	fr
rsr.view.SOP.doc	Voir Doc SOP	fr
rsr.view.tni.doc	Voir Doc TNI	fr
rt	(RT)	de
rt	(RT)	fr
RT	(RT)	fr
S_O_P	S.O.P	fr
s_subscribe	S: Abonnieren	de
s_subscribe	S: Abonnez-vous	fr
s.no.	S.No.	fr
save_as_pdf	Enregistrer en PDF	fr
save_questions	Sauvegarder question	fr
Schedule Approval	Approbation du calendrier	fr
scheduler_mail_scheduled_day_before_effective_date	Courrier Prévu Day Before Date effective	fr
scheduler_password_reset_days	Kennwort Gültigkeit in Tagen	de
scheduler_password_reset_days	Mot de passe Validité en jours	fr
score	But%	fr
screen_names	Screen Names	de
screen_names	noms d'écran	fr
search_based_on	Basé sur la recherche	fr
search_job_responsibilities_by	Rechercher Responsabilités emploi par	fr
search_ref_doc_no	Suche Ref. Doc. Nein.	de
search_ref_doc_no	Rechercher Réf. Doc. Non.	fr
search_trainer	Suche Trainer	de
search_trainer	Recherche Formateur	fr
section	Abschnitt	de
section	Section	fr
section	Section	en
select	Sélectionner	fr
select_activities	Choisissez les activités	fr
select_appropriate_role	Sélectionnez rôle approprié.	fr
select_appropriate_site	sélectionnez le site approprié.	fr
select_atleast_one_option	Sélectionnez une option atleast.	fr
select_attempt	Wählen Attempt	de
select_attempt	Sélectionnez Tenter	fr
select_audio_video_file	Wählen Sie Audio / Video-Datei	de
select_audio_video_file	Sélectionnez Fichier Audio / Vidéo	fr
select_category	Choisir Une Catégorie	fr
select_client	Test	fr
select_criteria	Sélectionner des critères	fr
select_department	Wählen Sie die Abteilung	de
select_department	Sélectionnez Département	fr
select_designation	Wählen Sie die Bezeichnung	de
select_designation	Sélectionnez Désignation	fr
select_employee	Sélectionnez employés	fr
select_employee_by	Sélectionnez employés par	fr
select_function_code	Select Function Code.	de
select_function_code	Sélectionnez le code de fonction.	fr
select_image	Bild auswählen	de
select_image	Sélectionner l'image	fr
select_jr	Sélectionnez JR	fr
select_language	Choisir La Langue	fr
select_modules	Sélectionnez Modules	fr
select_presentation	Sélectionnez Présentation	fr
select_ref_doc_no	Ref Select. Doc. Nein.	de
select_ref_doc_no	Sélectionnez Réf. Doc. Non.	fr
select_report_type	Wählen Sie Report Type	de
select_report_type	Sélectionnez le type de rapport	fr
select_site_for_department	Choisir site pour le ministère	fr
select_sop	Sélectionnez SOP	fr
select_sop_type	Wählen SOP Typ	de
select_sop_type	Sélectionner le type de SOP	fr
select_sub_category	Sélectionnez Sous catégorie	fr
select_test	Sélectionnez Test	fr
select_tnis	Sélectionnez TNIS	fr
select_training_topic	Wählen Ausbildung Topic	de
select_training_topic	Sélectionnez Sujet de la formation	fr
select_user	Wählen Sie Benutzer	de
select_user	Sélectionnez Utilisateur	fr
select_version_type	Wählen Version Type	de
select_version_type	Sélectionnez Exécution Type	fr
selected_activities	Activités sélectionnés	fr
selected_document_view	Voir document sélectionné	fr
selected_job_responsibilities	Responsabilités d'emploi sélectionnés	fr
selected_tnis	TNIS sélectionnés	fr
send 	Envoyer	fr
send_mail_to_when_sop_expired	Envoyer un mail Lorsque SOP expiré	fr
show_all_functions	Voir toutes les fonctions	fr
sign_off	Abmelden	de
sign_off	Se Deconnecter	fr
signature	Signature	fr
signin	S'inscrire	fr
site_	SITE	fr
site_1	Site:	fr
site_address	SiteAdresse:	fr
site_already_exist_with_given_name	Site existent déjà avec le nom donné	fr
site_city	SiteCity:	fr
site_country	SiteCountry:	fr
site_fax	SiteFax:	fr
site_has_been_created_successfully	Site a été créé avec succès.	fr
site_id	Site Id	fr
site_maintanance	Site Maintainance	fr
site_not_found	Site not found.	en
site_not_found	Seite nicht gefunden.	de
site_not_found	Site introuvable.	fr
site_pdf	Site:	fr
site_phone	SitePhone:	fr
site_pincode	SitePincode:	fr
site_state	SiteState:	fr
site_status	SiteStatus:	fr
Site:	: [Harmonisé]	fr
site.create	Créer un site	fr
site.location	Emplacement du site	fr
site.name	Nom du site	fr
site.search	Recherche	fr
site.update	Mise à jour du site	fr
site.view	Voir le site	fr
sites_not_found	Sites introuvables.	fr
some_compulsory_questions_are_left_unattempted	Certaines questions obligatoires sont laissés unattempted.	fr
sop_already_exists_for_given_refrence_document_number	SOP existe déjà pour le numéro de document donnée refrence	fr
task_detail	Tâche Détail	fr
sop_approved_successfully	SOP approved successfully.	en
sop_approved_successfully	SOP erfolgreich genehmigt.	de
sop_approved_successfully	SOP approuvé succès.	fr
sop_approved_successfully_but_error	SOP Approved Successfully but error while SOP training and live test training creation.	en
sop_approved_successfully_but_error	SOP Erfolgreich genehmigt, aber Fehler beim SOP Training und Live-Test Training Schöpfung.	de
sop_approved_successfully_but_error	SOP Approuvé succès mais l'erreur tandis que la formation de SOP et la création d'une formation de test en direct.	fr
sop_category	MON-Catégorie	fr
sop_department_code	Sop Abteilungscode	de
sop_department_code	Sop code de département	fr
sop_department_code_display_utility	SOP Deparment utilitaire de code	fr
sop_details_updated_successfully	SOP details updated Successfully.	en
sop_details_updated_successfully	SOP Details erfolgreich aktualisiert.	de
sop_details_updated_successfully	SOP détails mis à jour avec succès.	fr
sop_details not_found	SOP Details not found.Please try again!	en
sop_details not_found	SOP-Details nicht gefunden.Bitte noch einmal versuchen!	de
sop_details not_found	Détails SOP pas found.Please essayer à nouveau!	fr
sop_inactivate_successfully	SOP inaktivieren erfolgreich.	de
sop_inactivate_successfully	SOP inactiver succès.	fr
sop_is_trainer_cert_required	Trainer Certificate Required	de
sop_is_trainer_cert_required	Certificat formateur Requis	fr
SOP_media_upload	SOP médias chargement	fr
sop_min_passing_percentagee	Min Passing Percentage	en
sop_min_passing_percentagee	Mindest Passing Prozent	de
sop_min_passing_percentagee	Pourcentage minimum Passing	fr
sop_name/documentName	SOP Name / Document	de
sop_name/documentName	SOP Nom / DocumentName	fr
sop_no_of_question_display	Anzahl der Fragen Display (Sollte als kein Of Questions weniger)	de
sop_no_of_question_display	Nombre de questions Display (doit être inférieure à Pas de questions)	fr
sop_not_found	Sop non trouvé!	fr
sop_not_found_for_the_sop_function_mapping	Sop not found for the Sop function mapping.	en
sop_not_found_for_the_sop_function_mapping	Sop Sop nicht für die Funktionszuordnung gefunden.	de
sop_not_found_for_the_sop_function_mapping	Sop pas trouvé pour la cartographie de la fonction Sop.	fr
sop_pending_employees_report.	Sop Pending Mitarbeiter Bericht	de
sop_pending_employees_report.	Sop attente Rapport employés	fr
sop_question_updated_successfully	Sop question updated successfully.	en
sop_question_updated_successfully	Sop Frage erfolgreich aktualisiert.	de
sop_question_updated_successfully	Question Sop mis à jour avec succès.	fr
sop_reamind_month	SOP Verfall Reminder Monat (sollte weniger als gültig bis-Datum (in Monaten))	de
sop_reamind_month	SOP Mois d'expiration de rappel (doit être inférieure à valide jusqu'à la date (en mois))	fr
sop_reason_for_change	Raison SOP pour le changement	fr
sop_report	SOP Bericht	de
sop_report	Rapport SOP	fr
sop_send_mail_to_before_sop_expired_email	Mail an Bevor SOP ist abgelaufen	de
sop_send_mail_to_before_sop_expired_email	Envoyez un courriel à Avant SOP est expirée	fr
sop_test_report	SOP Training Report	en
sop_training_allowance_period	Formation Période Provision pour In-Effect SOP	fr
sop_training_certificate	Ausbildungsnachweis	de
sop_training_certificate	Certificat de formation	fr
sop_training_status	SOP Trainingszustand	fr
sop_trainings_attended	SOP Formations assisté	fr
sop_trainings_pending	SOP Formations attente	fr
sop_updated_successfully	SOP updated successfully.	en
sop_updated_successfully	SOP erfolgreich aktualisiert.	de
sop_updated_successfully	SOP mis à jour avec succès.	fr
SOP_Upload	SOP hochladen	de
SOP_Upload	SOP chargement	fr
sop_valid_till_date	SOP Gültig bis heute	de
sop_valid_till_date	SOP valide jusqu'à la date	fr
sop_wise	SOP Wise	fr
SOP Function Mapping	Cartographie de la fonction SOP	fr
SOP Management	SOP-Management	de
SOP Management	Gestion SOP	fr
SOP View Report	SOP Afficher rapport	fr
specific_individuals	Individus particuliers	fr
start_test	Démarrer le test	fr
start_time	Heure de début	fr
start_time_is_clash_with_other_departments	Start time is clash with other departments.	en
start_time_is_clash_with_other_departments	Startzeit kollidieren mit anderen Abteilungen.	de
start_time_is_clash_with_other_departments	Heure de départ est en conflit avec d'autres ministères.	fr
start_time_should_be_before_end_time	Start time should be before end time.	en
start_time_should_be_before_end_time	Startzeit sollte vor Ende der Zeit sein.	de
start_time_should_be_before_end_time	Heure de départ devrait être avant l'heure de fin.	fr
sub_department	Sub-Abteilung	de
sub_department	Sous Département	fr
sub_department_names	Unterabteilungsnamen	de
sub_department_names	Sous Noms Département	fr
subcategory	Sous-catégorie	fr
submit	Soumettre	fr
surname	Nom de famille	fr
tab_assignment	Affectation	fr
tab_department	Département	fr
tab_designation_group	Bandes	fr
tab_emp_regulatory	Formation obligatoire	fr
tab_emp_role_mapping	EmployeRoleMapping	fr
tab_emp_sop_mapping	Cartographie des SOP des employés	fr
tab_employee	Employé	fr
tab_hod	HOD	fr
tab_multilingual_screen	Écran multilingue	fr
tab_permission	Onglet Autorisations	fr
tab_permissions	Autorisation	fr
tab_sheet_upload	Fiche de chargement	fr
tab_site	Site	fr
tab_skill_matrix	Matrice de Skill	fr
tab_test	Test	fr
tab_trainer	Entraîneur	fr
tab_training	Formation	fr
tab_training_manger_status	Responsable de la formation Statut	fr
tab_upload_employee_details	Télécharge Détails employés	fr
tab_upload_induction	Ajouter à induction	fr
tab_uplolad_induction	Ajouter à induction	fr
tab_view_documents	Voir les documents	fr
task	Aufgabe	de
task	Tâche	fr
task_auto_close_days	Aufgabe Auto Close Tage	de
task_auto_close_days	Tâche Auto Close Jours	fr
task_critical_priority_days	Aufgabe kritischer Priorität (in Tagen)	de
task_critical_priority_days	Tâche Priorité critique (en jours)	fr
task_detail	Task Detail	en
task_detail	Aufgabendetail	de
task_high_priority_days	Aufgabe mit hoher Priorität Tage	de
task_high_priority_days	Jours tâche de haute priorité	fr
task_low_priority_days	Aufgabe Niedrige Priorität Tage	de
task_low_priority_days	Groupe Low Days prioritaires	fr
task_normal_priority_days	Aufgabe Normale Priorität Tage	de
task_normal_priority_days	Tâche normale Days prioritaires	fr
test	Test	fr
test_can_not_be_generated_contact_to_your_department_head	Test ne peut pas être généré. Votre essai bloqués n'a pas été approuvé. S'il vous plaît contacter à votre chef de département.	fr
test_can_not_be_generated_you_have_already_attempted_3_times_please_contact_to_your_department_head	Test ne peut pas être généré. Vous avez déjà essayé 3 fois. S'il vous plaît contacter à votre chef de département.	fr
test_can_not_be_generated_your_blocked_test_has_not_been_approved_please_contact_to_head	Test ne peut pas être généré. Votre essai bloqués n'a pas été approuvé. S'il vous plaît contacter à votre chef de département.	fr
test_create_date	Test Create Date	en
test_create_date	Testerstellungsdatum	de
test_create_date	Date de test Créer	fr
test_data_saved_successfully	Les données de test enregistrées avec succès	fr
test_date	Date de test	fr
test_details	Détails du test	fr
test_for_the_following_SOP_will_be_removed	Test for the following SOP will be removed.	en
test_for_the_following_SOP_will_be_removed	Test für folgenden SOP wird entfernt.	de
test_for_the_following_SOP_will_be_removed	Test de la SOP suivante sera supprimé.	fr
test_not_found_for_the_training	Test not found for the Training.	en
test_not_found_for_the_training	Test nicht für die Ausbildung gefunden.	de
test_not_found_for_the_training	Le test n'a pas trouvé pour la formation.	fr
test_paper	Testblatt	de
test_paper	Épreuve	fr
the_SOP_is_mapped_at	Le POS est mappé à l'adresse:	fr
there_is_no_such_training_exists	Il n'y a pas de formation existe!	fr
this_action_requires_a_sign_off	Die Aktion verlangt ein Zeichen aus. Bitte mit Ihrer Benutzer-ID und Passwort an.	de
this_action_requires_a_sign_off	Cette action nécessite un signe off. S'il vous plaît vous connecter avec votre nom d'utilisateur et mot de passe.	fr
this_is_your_last_attempt	Ceci est votre dernière tentative.	fr
this_sop_is_read_acknowledge	Das SOP ist Lesen und Quittieren.	de
this_sop_is_read_acknowledge	Ce MON est Lire et Reconnaître.	fr
this_sop_is_read&Acknowledge	Das SOP ist Lesen und Quittieren.	de
this_sop_is_read&Acknowledge	Ce MON est Lire et Reconnaître.	fr
time	Temps	fr
time_accepted	Time accepted	en
time_accepted	Mal angenommen	de
time_accepted	temps accepté	fr
title	Titre	fr
tni	TNI	fr
tni_category	TNI Catégorie	fr
tni_category_created_successfully	TNI Catégorie créé avec succès.	fr
tni_sub_category	TNI Sous-catégorie:	fr
tni_subcategory	TNI Sous-	fr
tni_subcategory_already_exists	TNI Sous-catégorie existe déjà.	fr
tni_subcategory_created_successfully	TNI Sous créé avec succès.	fr
tni_training_status	TNI formation Statut	fr
tni_trainings_pending	TNI Formations attente	fr
tni_upcoming_training	Formation à venir TNI	fr
to	 --to--	fr
To	À	fr
to_date	Miteinander Ausgehen	de
to_date	À Ce Jour	fr
to_do_list	To-Do-Liste	de
to_do_list	Liste De Choses À Faire	fr
today	Aujourd'hui	fr
total_questions	Total Questions	fr
trainer	Entraîneur	fr
Trainer	Entraîneur	fr
trainer_already_exists	Entraîneur existe déjà !!	fr
trainer_could_not_be_updated	Formateur peut pas mise à jour.	fr
trainer_created_successfully	Trainer Created Successfully.	en
trainer_created_successfully	Trainer erfolgreich erstellt.	de
trainer_created_successfully	Entraîneur créé avec succès.	fr
trainer_created_with_name	Entraineur Crée Avec Nom donné.	fr
trainer_designation_updated	Désignation formateur mis à jour	fr
trainer_experience_updated	Entraîneur expérience mis à jour	fr
trainer_id	Près	fr
trainer_info	Entraîneur Infos	fr
trainer_information	Informations formateur	fr
trainer_organization_updated	Organisation formateur mis à jour	fr
trainer_type	Type de formateur	fr
trainer_type 	Type de formateur	fr
trainer_updated_successfully	Formateur à jour avec succès.	fr
Training	Formation	fr
training_allowance	Formation Période Provision pour In-Effect SOP	fr
training_attended	Formations suivies	fr
training_created_successfully	Training Created Successfully and Mail Send to Respective Employee.	en
training_created_successfully	Training erfolgreich erstellt und Post an die jeweiligen Mitarbeiter senden.	de
training_created_successfully	Formation créé avec succès and Mail Envoyer à des employés respectifs.	fr
training_date	Formation Date	fr
training_dates	Dates de la formation	fr
training_description	Description de la formation	fr
training_details	Détails de la formation	fr
training_end_date	Formation Date de fin	fr
training_generated	Formation Création	fr
training_has_been_unblocked_for	Training has been unblocked for 	en
training_has_been_unblocked_for	Training für entsperrt worden	de
training_has_been_unblocked_for	La formation a été débloquée pour	fr
training_has_not_been_created_yet	Formation n'a pas encore été créé.	fr
training_information	Renseignements sur la formation	fr
training_manager	Responsable de la formation	fr
training_report	Bildungsbericht	de
training_report	Rapport de formation	fr
training_report_title	Formations et rapports	fr
training_sop_report	Training SOP Bericht	de
training_sop_report	Rapport de formation SOP	fr
training_start_date	Formation Date de début	fr
training_status	Formation Statut	fr
training_time	Temps de formation	fr
training_waived_off_succesfully	Training waived off succesfully.	en
training_waived_off_succesfully	Training verzichtet off erfolgreich.	de
training_waived_off_succesfully	Formation renoncé au large succès.	fr
training.after.effictive.date.comment	Commentaire	fr
training.assessment	Évaluation	fr
training.assessment.no	Aucun	fr
training.assessment.yes	Oui	fr
training.create	Créer Formation	fr
training.date.effective	Date d'effet	fr
training.date.implementation	Date de mise en œuvre	fr
training.edit	Modifier formation	fr
training.name	Nom de la formation	fr
training.search	Recherche	fr
training.sel.all	Tous	fr
training.sel.deptspecific	Département spécifique	fr
training.sel.desigspecific	Désignation spécifique	fr
training.sel.empspecific	Employé spécifi	fr
training.sel.rolespecific	Rôle spécifique	fr
training.sel.sitespecific	spécifique du site	fr
training.text	Formation	fr
training.type	Type de formation	fr
training.type.classroom	Salle de classe	fr
training.type.on_job_training	Sur la formation professionnelle	fr
training.view	Voir formation	fr
trainings_not_found	Formations introuvables!	fr
transfer	Transfert	fr
type	Art	de
type	Type	fr
type_of_approval	Type d'approbation	fr
type_of_document	Type de document	fr
unblock	Débloquer	fr
under_approval_pending	Unter ungeprüftes	de
under_approval_pending	Sous attente d'être approuvé	fr
unknown_error	Erreur Inconnue !!!	fr
upcoming_training	Formation à venir	fr
upcoming_trainings	Formations à venir	fr
update	Mettre à jour	fr
update_induction_sheet	Update Induction Sheet	en
update_induction_sheet	Update Induktionsnoten	de
update_induction_sheet	Mise à jour induction Sheet	fr
update_mapping	Update Mapping	en
update_mapping	Aktualisierung Abbildung	de
update_mapping	Mise à jour de la cartographie	fr
update_upper	UPDATE	de
update_upper	MISE À JOUR	fr
updated	Mise à jour	fr
updated_induction_sheet_uploaded_successfully	Updated induction sheet uploaded successfully.	en
updated_induction_sheet_uploaded_successfully	Aktualisiert Induktions Blatt erfolgreich hochgeladen.	de
updated_induction_sheet_uploaded_successfully	Feuille d'induction Mise à jour téléchargé avec succès.	fr
updated_permissions_for_employee	Aktualisiert Berechtigungen für Mitarbeiter	de
updated_permissions_for_employee	Autorisations mises à jour pour les employés	fr
updated_permissions_for_role	Aktualisiert Berechtigungen für Rolle	de
updated_permissions_for_role	Autorisations mises à jour pour rôle	fr
upload_certificate	Upload Certificate	de
upload_certificate	Télécharger le certificat	fr
upload_directly	Télécharger directement	fr
upload_induction	Upload Induction	de
upload_induction	Ajouter à induction	fr
upload_inductiona_training	Télécharge formation Inductiona	fr
upload_mode	Upload mode	fr
upload_mode=	Upload-Modus	de
upload_mode=	Upload mode	fr
upload_sheet	Upload Sheet	en
upload_sheet	Noten hochladen	de
upload_sheet	Télécharger Fiche	fr
upload_tni	Télécharger le document	fr
uploaded_emp	Les employés uploadés	fr
uploaded_sop	Téléchargée SOP	fr
uploaded_sops	SOP uploadés	fr
uploded_induction_training_sheet	Uploded Einarbeitung Blatt	de
uploded_induction_training_sheet	Uploded induction formation Sheet	fr
user	utilisateur	fr
user_groups	Benutzergruppen	de
user_groups	Groupes d'utilisateurs	fr
user_has_been_created_successfully_password_has_been_sent_to_registered_email_address	L'utilisateur a été créé avec succès. Mot de passe a été envoyé à l'adresse e-mail enregistrée.	fr
user already logged in	Utilisateur déjà connecté.	fr
user already logged in.	\N	fr
username	Nom d'utilisateur	fr
username_and_password_does_not_match	Benutzernamen und Passwort nicht match.Please versuchen Sie es erneut.	de
username_and_password_does_not_match	Nom d'utilisateur et mot de passe ne match.Please essaient de ne pas à nouveau.	fr
User Report	Rapport de l'utilisateur	fr
Validation Schedule	Validation annexe	fr
value	Valeur	fr
value_must_be_smaller_than_100	Der Wert muss kleiner als 100 sein.	de
value_must_be_smaller_than_100	La valeur doit être inférieure à 100.	fr
version	Version	fr
version_no	Version No	en
version_no	Keine Version	de
version_no	Version No.	fr
view_adhoc_training	Ansicht Adhoc Ausbildung	de
view_adhoc_training	Formation Voir Adhoc	fr
view_attendance_sheet	Ansicht Anwesenheits	de
view_attendance_sheet	Voir Feuille de présence	fr
view_certificate	Zertifikat anzeigen	de
view_certificate	Voir le certificat	fr
view_completed_trainings	View Completed Trainings	en
view_completed_trainings	Ansicht Abgeschlossene Trainings	de
view_completed_trainings	Voir Terminé Formations	fr
view_employee	Mitarbeiter anzeigen	de
view_employee	Voir employés	fr
view_functions	Ansicht Funktionen	de
view_functions	Voir Fonctions	fr
view_pending_trainings	View Pending Trainings	en
view_pending_trainings	Anstehende Trainings	de
view_pending_trainings	Voir attente Formations	fr
view_presentation_document	Voir le document de présentation	fr
view_question_doc	Frage zum Produkt Doc	de
view_question_doc	Voir question Doc	fr
view_sop	Voir SOP	fr
view_sop_document	Voir le document SOP	fr
view_sop_tni	Voir SOP / TNI	fr
view_test	Ansicht-Test	de
view_test	Voir le test	fr
view_tni	Voir TNI	fr
view_trainer_by_topic	Voir formateur Par thème	fr
view_training_attendance	Ansicht Ausbildung Attendance	de
view_training_attendance	Voir formation Participation	fr
view_trainings	Ansicht Trainings	de
view_trainings	Voir les formations	fr
View Mapping	Voir la cartographie	fr
View Schedules	Voir les horaires	fr
week	Semaine	fr
welcome	Bienvenue	fr
wfcm_adhoc_rpt_mgr_in_emp_screen	Adhoc Reporting Manager In Mitarbeiterbildschirm	de
wfcm_adhoc_rpt_mgr_in_emp_screen	Adhoc Reporting Manager Dans l'écran des employés	fr
wfcm_adhoc_trng_mgr_in_emp_screen	Adhoc Training Manager In Mitarbeiterbildschirm	de
wfcm_adhoc_trng_mgr_in_emp_screen	Adhoc Training Manager Dans l'écran des employés	fr
wfcm_hr_dept_id	Wählen Sie HR-Abteilung Ihres Unternehmens	de
wfcm_hr_dept_id	Sélectionnez le département des ressources humaines de votre entreprise	fr
wfcm_induction_pending_blocked_days	Induction Pending Gesperrt Tage	de
wfcm_induction_pending_blocked_days	Jours induction attente Bloqué	fr
wfcm_induction_pending_intimation_days	Induction Pending Andeutung Tage	de
wfcm_induction_pending_intimation_days	Induction attente intimation Jours	fr
wfcm_induction_training_type	Induktionstraining Art	de
wfcm_induction_training_type	Induction Type de formation	fr
wfcm_pending_induction_other_email_ids	Andere E-Mail-Adresse	de
wfcm_pending_induction_other_email_ids	Autre adresse email	fr
what_do_you_want_to_inactivate	Was sagen Sie zu inaktivieren wollen	de
what_do_you_want_to_inactivate	Que voulez-vous pour inactiver	fr
wrong_answers	Mauvaises réponses	fr
wrong_file_format_please_select_excel_file	Mauvais format de fichier. S'il vous plaît sélectionner le fichier Excel.	fr
Yearly Reports	Rapports annuels	fr
you_are_already_appeared_for_this_training	You are already appeared for this training or may be waived off by authority.	en
you_are_already_appeared_for_this_training	Sie sind bereits für dieses Training erschienen oder durch Vollmacht verzichtet werden.	de
you_are_already_appeared_for_this_training	Vous êtes déjà comparu pour cette formation ou peut être levée au large par l'autorité.	fr
you_are_currently_working_on_site 	Vous travaillez actuellement sur le site	fr
you_have_not_attempted_all_the_questions	Vous ne l'avez pas essayé toutes les questions.	fr
sop_questions_updated_for_sop	SOP questions updated for sop:	en
your_account_has_been_blocked_pls_login_after_mins	Votre compte a été bloqué. S'il vous plaît Connectez-vous après 30 minutes.	fr
your_scorecard	Votre tableau de bord	fr
your_test_has_been_blocked_and_not_been_approved	Your test has been blocked and not been Approved.Please contact to your Department Head.	en
your_test_has_been_blocked_and_not_been_approved	Ihr Test wurde blockiert und nicht in ihre Abteilungsleiter Approved.Please Kontakt.	de
your_test_has_been_blocked_and_not_been_approved	Votre essai a été bloqué et ne été Approved.Please contact à votre chef de département.	fr
jobDescription_created_with_employee_id	JobDescription created with Employee Id:	en
jobDescription_created_with_employee_id	Description de l'offre créée avec des employés Id:	fr
jobDescription_created_with_employee_id	Jobbeschreibung erstellt mit Mitarbeiter-ID:	de
jobDescription_updated_with	JobDescription updated with:	en
jobDescription_updated_with	Description de l'offre mise à jour avec:	fr
jobDescription_updated_with	Jobbeschreibung aktualisiert mit:	de
mail_schedular	\N	de
adhoc_training_topic_created_with	Adhoc Training Topic Created with:	en
adhoc_training_topic_created_with	Adhoc Sujet formation Créé avec:	fr
adhoc_training_topic_created_with	Adhoc Trainings Thema Erstellt mit:	de
mandatory_trainings_generated_after_sop_regeneration	Obligatorische Schulungen nach sop Regeneration erzeugt	de
mandatory_trainings_generated_after_sop_regeneration	Mandatory trainings generated after sop regeneration	en
mandatory_trainings_generated_after_sop_regeneration	Formations obligatoires générés après régénération sop	fr
admin_configuration_updated	Admin Configuration Updated:	en
admin_configuration_updated	Configuration Admin Mis à jour:	fr
admin_configuration_updated	Admin Konfiguration Aktualisiert:	de
all_version	Tous Version	fr
all_version	Alle Version	de
applied_and_approval_of_block_test	aufgebracht und Zulassung von Testblock Eintrag gefunden falsche auch nach Benutzer haben den Test abgeschlossen. Etwas, was falsch ist	de
applied_and_approval_of_block_test	applied and approval of block test entry found false even after user have not completed the test. Some thing is wrong for	en
applied_and_approval_of_block_test	appliquée et l'approbation de l'entrée de test de bloc trouvé fausse même après que l'utilisateur n'a pas terminé l'épreuve. Quelque chose est mauvais pour	fr
approve_blocked_test_for	Approve Blocked Test For	en
approve_blocked_test_for	Approuver test bloqué pour	fr
approve_blocked_test_for	Genehmigen Geblockt Test für	de
modules_role	Moduls Rolle	de
blocked_test_approved	Blocked Test Approved:	en
blocked_test_approved	Essai Bloqué Approuvé:	fr
blocked_test_approved	Blockiert Prüfung geprüft werden:	de
cancel_the_test_for_the	cancel the test for the	en
cancel_the_test_for_the	Test des aufheben	de
cancel_the_test_for_the	annuler le test pour le	fr
new_role(s)_created_with_name	New Role(s) created with name	en
new_role(s)_created_with_name	Neue Rolle (n) mit dem Namen erstellt	de
new_role(s)_created_with_name	Nouveau rôle (s) créé avec le nom	fr
change_details_for_disapproved_SOP	Change Details for Disapproved SOP	en
change_details_for_disapproved_SOP	Changer Détails pour Refusé SOP	fr
change_details_for_disapproved_SOP	Ändern Sie zum Abgelehnte SOP	de
class_room_training_created_for	Class Room Training Created for:	en
class_room_training_created_for	Stage de formation Chambre Créé pour:	fr
class_room_training_created_for	Klassenzimmer Schulung Erstellt für:	de
classroom_view_completed_training_screen	Classroom-view completed training screen- Employee's completed test details updated with:	en
classroom_view_completed_training_screen	Classroom-vue terminée formation de ses employés les détails des tests achevés mis à jour avec:	fr
classroom_view_completed_training_screen	Classroom-Ansicht eine Ausbildung Screening Mitarbeiters beendet Testdetails mit aktualisiert:	de
classroom_view_pending_training_screen_employee_appeared_for_test_with	Classroom-view pending training screen-Employee Appeared for Test with:	en
classroom_view_pending_training_screen_employee_appeared_for_test_with	Classroom-vue en attendant la formation d'écran employé Apparu pour l'essai avec:	fr
classroom_view_pending_training_screen_employee_appeared_for_test_with	Classroom-Ansicht anstehenden Trainingsbild-Mitarbeiter erschien zum Testen mit:	de
complete_function_mapping_for	Complete function mapping for	en
complete_function_mapping_for	Mappage de fonction complètes	fr
complete_function_mapping_for	Komplette Funktionszuordnung für	de
complete_induction_training_for	Complete induction training for	en
complete_induction_training_for	La formation d'induction complètes	fr
complete_induction_training_for	Vollständige Induktion Ausbildung für	de
complete_training_for	Complete training for	en
complete_training_for	Formation complète pour	fr
complete_training_for	Komplette Ausbildung für	de
create_job_description_for	Create job description for	en
create_job_description_for	Créer description d'emploi pour	fr
create_job_description_for	Erstellen Sie Job-Beschreibung für	de
no_employee_mapping_found_with_this_function	Pas de cartographie employé trouvé avec cette fonction.	fr
no_employee_mapping_found_with_this_function	Kein Mitarbeiter-Mapping mit dieser Funktion gefunden.	de
no_employee_mapping_found_with_this_sop	Pas de cartographie employé trouvé avec ce sop.	fr
no_employee_mapping_found_with_this_sop	Kein Mitarbeiter-Mapping mit diesem sop gefunden.	de
creating_function_please_try_again_later	\N	de
no_function_mapped_with_this_sop	Aucune fonction mappé avec ce sop.	fr
no_function_mapped_with_this_sop	Nein Funktion mit diesem sop abgebildet.	de
no_function_mapping_found_with_this_employee	Pas de mappage de fonction trouvée avec cet employé.	fr
no_function_mapping_found_with_this_employee	Keine Funktionszuordnung mit dieser Mitarbeiter gefunden.	de
department_code_created_with	Department Code Created with:	en
department_code_created_with	Code de département Créé avec:	fr
department_code_created_with	Abteilungscode Erstellt mit:	de
department_created_with	Department created with:	en
department_created_with	Département créé avec:	fr
department_created_with	Abteilung erstellt mit:	de
department_deactivated	Department deactivated.	en
department_deactivated	Ministère désactivé.	fr
department_deactivated	Abteilung deaktiviert.	de
department_updated_with	Department updated with:	en
department_updated_with	Département mis à jour avec:	fr
department_updated_with	Abteilung aktualisiert mit:	de
no_sop_mapped_with_this_function	Kein sop mit dieser Funktion zugeordnet.	de
no_sop_mapped_with_this_function	Aucune sop mappée avec cette fonction.	fr
no_sop_mapping_found_with_this_employee	Pas de cartographie sop trouvé avec cet employé.	fr
no_sop_mapping_found_with_this_employee	Kein sop Mapping mit diesem Mitarbeiter gefunden.	de
designation_created_with	Designation created with:	en
designation_created_with	Désignation créé avec:	fr
designation_created_with	Bezeichnung mit erstellt:	de
designation_deactivated	Designation deactivated.	en
designation_deactivated	Désignation désactivé.	fr
designation_deactivated	Bezeichnung deaktiviert.	de
designation_updated_to	Designation updated to:	en
designation_updated_to	Désignation mis à jour:	fr
designation_updated_to	Bezeichnung auf:	de
password_reset_successfully_by	Kennwort erfolgreich zurückgesetzt durch:	de
password_reset_successfully_by	Password reset successfully By:	en
password_reset_successfully_by	Mot de passe correctement remis à zéro par:	fr
emp_id	\\u5458\\u5DE5\\u6807\\u8BC6	zh
emp_name	员工姓名	zh
employee_adhoc_training_created_with	Employee Adhoc Training Created with:	en
employee_adhoc_training_created_with	Employé Adhoc formation Créé avec:	fr
employee_adhoc_training_created_with	Mitarbeiter Adhoc Trainings Erstellt mit:	de
employee_appeared_for_test_with	Employee Appeared for Test with:	en
employee_appeared_for_test_with	Apparu employé pour l'essai avec:	fr
employee_appeared_for_test_with	Mitarbeiter erschien zum Testen mit:	de
employee_created_with	Employee created with:	en
employee_created_with	Employé créé avec:	fr
employee_created_with	Mitarbeiter mit erstellt:	de
employee_deactivated_in_site	Employee deactivated in site:	en
employee_deactivated_in_site	Employé activé sur le site:	fr
employee_deactivated_in_site	Mitarbeiter in Website deaktiviert:	de
employee_function_mapping_report	Employé-Fonction Rapport Mapping	fr
employee_function_mapping_report	Mitarbeiter-Function Mapping Bericht	de
please_enter_numeric_value_between	\N	de
employee_sop_mapping_report	Employé-sop Rapport Mapping	fr
employee_sop_mapping_report	Mitarbeiter-sop Mapping Bericht	de
employee_updated_to	Employee updated to:	en
employee_updated_to	Employé mis à jour:	fr
employee_updated_to	Mitarbeiter auf:	de
please_map_function_to	Please map Function to	en
please_map_function_to	S'il vous plaît carte Fonction pour	fr
please_map_function_to	Bitte Kartenfunktion zu	de
please_select_a_valid_department_and	\N	de
final_SOP_uploaded_with	Final SOP Uploaded with:	en
final_SOP_uploaded_with	SOP final Uploaded with:	fr
final_SOP_uploaded_with	Schluss SOP Uploaded with:	de
finalize_job_description_for	Finalize job description for	en
finalize_job_description_for	Finaliser description de poste pour	fr
finalize_job_description_for	Finalisieren Sie die Aufgabenbeschreibung für	de
function_approval_pending_for	Fonction Approbation en attente pour	fr
function_approval_pending_for	Funktion Zulassung beantragt für	de
function_approved_with	Function Approved with:	en
function_approved_with	Fonction Approuvé avec:	fr
function_approved_with	Funktion Zugelassen mit:	de
please_select_atleast_one_training	S'il vous plaît sélectionner au moins un entraînement.	fr
please_select_atleast_one_training	Bitte wählen Sie atleast eine Ausbildung.	de
function_created_with	Function Created with:	en
function_created_with	Fonction Créé avec:	fr
function_created_with	Funktion Erstellt mit:	de
function_deactivated	Function deactivated:	en
function_deactivated	Fonction désactivée:	fr
function_deactivated	Funktion deaktiviert:	de
function_employee_mapping_report	Fonction-employés Rapport Mapping	fr
function_employee_mapping_report	Function-Mapping Mitarbeiterbericht	de
function_mapping_created_with	Function mapping created with:	en
function_mapping_created_with	Funktionszuordnung mit erstellt:	de
function_mapping_created_with	Cartographie Fonction créé avec:	fr
function_mapping_updated_with	Funktionszuordnung aktualisiert mit:	de
function_mapping_updated_with	Function mapping updated with:	en
function_mapping_updated_with	La cartographie de la fonction mise à jour avec:	fr
function_sop_mapping_report	Fonction-Sop Rapport Mapping	fr
function_sop_mapping_report	Function-Sop Mapping Bericht	de
function_updated_with	Function Updated with:	en
function_updated_with	Fonction jour avec:	fr
function_updated_with	Funktion aktualisiert mit:	de
image_file_size_must_be_less_than	\N	de
induction_training_approved_for_employee_ID	Einführungsschulungen für Mitarbeiter-ID genehmigt:	de
induction_training_approved_for_employee_ID	Induction training approved for employee ID:	en
induction_training_approved_for_employee_ID	La formation d'induction approuvé pour l'ID d'employé:	fr
induction_training_completed_for_employee	Induction Training completed for employee:	en
induction_training_completed_for_employee	Induction Training absolviert für Mitarbeiter:	de
induction_training_completed_for_employee	Induction formation terminée pour l'employé:	fr
induction_training_created_with	Induction Training Created with:	en
induction_training_created_with	Induction formation créés:	fr
induction_training_created_with	Einarbeitung Erstellt mit:	de
induction_training_sheet_uploded	Induction Training Sheet Uploded:	en
induction_training_sheet_uploded	Fiche de formation induction uploded:	fr
induction_training_sheet_uploded	Einarbeitung Blatt uploded:	de
induction_training_topic_created_with	Induction Training Topic Created with:	en
induction_training_topic_created_with	Induction Sujet formation Créé avec:	fr
induction_training_topic_created_with	Einarbeitung Thema Erstellt mit:	de
induction_training_topic_updated_to	Induction Training Topic Updated To:	en
induction_training_topic_updated_to	Induction Sujet de formation mis à jour:	fr
induction_training_topic_updated_to	Einarbeitung Topic Aktualisiert um:	de
induction_training_updated_for_employee	Induction Training für Mitarbeiter aktualisiert:	de
induction_training_updated_for_employee	Induction Training updated for employee:	en
induction_training_updated_for_employee	Formation Induction mise à jour pour l'employé:	fr
induction_training_updated_with	Induction Training Updated with:	en
induction_training_updated_with	Induction de formation mis à jour avec:	fr
induction_training_updated_with	Einarbeitung aktualisiert mit:	de
item_id	Item Id	fr
item_id	Artikel-Nummer	de
jobDescription_created_with	Jobbeschreibung erstellt mit:	de
jobDescription_accepted_by_user_with	JobDescription accepted by user with:	en
jobDescription_accepted_by_user_with	Description de l'offre accepté par l'utilisateur avec:	fr
jobDescription_accepted_by_user_with	Jobbeschreibung durch Benutzer akzeptiert:	de
jobDescription_approved_by_HOD_with	JobDescription Approved by HOD with:	en
jobDescription_approved_by_HOD_with	Description de l'offre Approuvé par HOD avec:	fr
jobDescription_approved_by_HOD_with	Jobbeschreibung gebilligt HOD mit:	de
jobDescription_created_with	JobDescription created with:	en
jobDescription_created_with	Description de l'offre créé avec:	fr
please_specify_weekly_day_scheduler	\N	de
regulatory_training_completed	Regulatory Training Completed:	en
regulatory_training_completed	Formation réglementaire Terminé:	fr
regulatory_training_completed	Regulatory Ausbildung abgeschlossen:	de
retraining_generated_for	Retraining generated for:	en
retraining_generated_for	Umschulung erstellt für:	de
retraining_generated_for	Le recyclage généré pour:	fr
review_&_accept_your_job_description	Review & accept your job description	en
review_&_accept_your_job_description	Examiner et accepter votre description de poste	fr
review_&_accept_your_job_description	Bearbeiten und akzeptieren Ihre Stellenbeschreibung	de
site_created_with	Site Created with:	en
site_created_with	Site créé avec:	fr
site_created_with	Web-Site erstellt mit:	de
site_department_designation_and_bands_mapping_deactivated	Site,Department,Designation and Bands Mapping Deactivated	en
site_department_designation_and_bands_mapping_deactivated	Site, le service, la désignation et bandes Mapping Désactivé	fr
site_department_designation_and_bands_mapping_deactivated	Standort, Abteilung, Bezeichnung und Bands Mapping Deaktiviert	de
site_updated_to	Site Updated to:	en
site_updated_to	Site mis à jour pour:	fr
site_updated_to	Website aktualisiert, um:	de
sop_approval_pending_for	SOP Approval pending for	en
sop_approval_pending_for	Approbation SOP attente pour	fr
sop_approval_pending_for	SOP Zulassung beantragt für	de
sop_approved	Sop Approved:	en
sop_approved	Sop Approuvé:	fr
sop_approved	Sop Genehmigt:	de
sop_approved_with	SOP approved with:	en
sop_approved_with	SOP approuvé avec:	fr
sop_approved_with	SOP genehmigt mit:	de
sop_created_with	Sop created with:	en
sop_created_with	Sop créé avec:	fr
sop_created_with	Sop mit erstellt:	de
sop_created_with_changes	Sop created with changes:	en
sop_created_with_changes	Sop créé avec des changements:	fr
sop_created_with_changes	Sop mit Änderungen erstellt:	de
sop_deactivated	Sop deactivated:	en
sop_deactivated	Sop désactivé:	fr
sop_deactivated	Sop deaktiviert:	de
sop_disapproved	Sop Disapproved:	en
sop_disapproved	Sop Refusé:	fr
sop_disapproved	Sop Abgelehnt:	de
sop_disapproved_with	SOP disapproved with:	en
sop_disapproved_with	SOP désapprouvé avec:	fr
sop_disapproved_with	SOP missbilligt mit:	de
sop_employee_mapping_report	SOP employé-Rapport Mapping	fr
sop_employee_mapping_report	SOP-Mapping Mitarbeiterbericht	de
sop_function_mapping_deactivated	Sop function mapping deactivated:	en
sop_function_mapping_deactivated	Mappage de fonction Sop désactivé:	fr
sop_function_mapping_deactivated	Sop Funktionszuordnung deaktiviert:	de
sop_function_mapping_report	MON-Fonction Rapport Mapping	fr
sop_function_mapping_report	SOP-Function Mapping Bericht	de
sop_mapping_change_with	Sop Mapping change with:	en
sop_mapping_change_with	Changement de cartographie Sop avec:	fr
sop_mapping_change_with	Sop Mapping Änderung:	de
sop_questions_updated_for_sop	SOP Fragen für sop aktualisiert:	de
sop_questions_updated_for_sop	SOP des questions mises à jour pour sop:	fr
sop_test_report	Rapport de formation SOP	fr
sop_test_report	SOP Bildungsbericht	de
sop_trainings_generated_after_change_function_mapping	SOP Schulungen nach Änderung Funktionszuordnung generiert:	de
sop_trainings_generated_after_change_function_mapping	SOP trainings generated after change function mapping:	en
sop_trainings_generated_after_change_function_mapping	Formations SOP générés après la cartographie de la fonction de changement:	fr
sop_trainings_generated_after_function_mapping	SOP Trainings generated after function mapping:	en
sop_trainings_generated_after_function_mapping	SOP Trainings erzeugt nach Funktionszuordnung:	de
sop_trainings_generated_after_function_mapping	SOP Formations généré après la cartographie de la fonction:	fr
sop_updated_with	Sop Updated with:	en
sop_updated_with	Sop à jour avec:	fr
sop_updated_with	Sop aktualisiert mit:	de
system_found_previous_state_of_training	System found previous state of training'in_Progress	en
system_found_previous_state_of_training	System gefunden vorherige Zustand training'in_Progress	de
system_found_previous_state_of_training	Système trouvé état précédent de training'in_Progress	fr
system_not_found_block_test_entry_after_max_attempt	System not found block test entry after max attempt	en
system_not_found_block_test_entry_after_max_attempt	System nicht gefunden Block Test Eintrag nach max Versuch	de
system_not_found_block_test_entry_after_max_attempt	Système pas trouvé l'entrée de test de bloc après tentative max	fr
test_blocked_for_employee	Test blocked for employee:	en
test_blocked_for_employee	Test für Mitarbeiter blockiert:	de
test_blocked_for_employee	Essai bloqué pour l'employé:	fr
Toutes les formations	\N	de
trainer_created_with	Trainer Created with:	en
trainer_created_with	Entraîneur Créé avec:	fr
trainer_created_with	Trainer Erstellt mit:	de
training_certificate_generated_with	Ausbildungsnachweis generiert mit:	de
training_certificate_generated_with	Training Certificate Generated with:	en
training_certificate_generated_with	Certificat de formation générés avec:	fr
training_created_with	Training created with:	en
training_created_with	Formation créé avec:	fr
training_created_with	Training mit erstellt:	de
updated_tabs_permissions_for_role	Updated Tabs Permissions for Role:	en
updated_tabs_permissions_for_role	Aktualisiert Tabs Berechtigungen für Rolle:	de
updated_tabs_permissions_for_role	Mise à jour Tabs Autorisations pour rôle:	fr
updated_tabs_permissions_for_role_no_role_and_tabs	Updated Tabs Permissions for Role : No role and tabs assigned	en
updated_tabs_permissions_for_role_no_role_and_tabs	Aktualisiert Tabs Berechtigungen für Rolle: Keine Rolle und Registerkarten zugeordnet	de
updated_tabs_permissions_for_role_no_role_and_tabs	Mise à jour Tabs Autorisations pour rôle: Aucun rôle et les onglets assigné	fr
uploded_induction_training_sheet_updated_with	Uploded Induction Training Sheet updated with:	en
uploded_induction_training_sheet_updated_with	Uploded induction formation actualisation de la fiche avec:	fr
uploded_induction_training_sheet_updated_with	Uploded Einarbeitung Blatt aktualisiert mit:	de
user_mapped_with_module_and_roles	User Mapped with Module and Roles:	en
user_mapped_with_module_and_roles	User-Mapped mit Module und Rollen:	de
user_mapped_with_module_and_roles	Utilisateur mappé avec le module et rôles:	fr
waive_off_deviation_created_with	Waive off Deviation created with:	en
waive_off_deviation_created_with	Renoncer au large écart créé avec:	fr
waive_off_deviation_created_with	Verzichten off Abweichung mit erstellt:	de
you_are_currently_working_on_site	\N	de
mandatory_sop_training_generated_after_sop_approved	Mandatory SOP training generated after sop approved:	en
mandatory_sop_training_generated_after_sop_approved	Pflicht SOP Ausbildung erzeugt nach sop genehmigt:	de
mandatory_sop_training_generated_after_sop_approved	Formation SOP obligatoire généré après sop approuvé:	fr
\.


--
-- Data for Name: cams_login_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_login_master (id, user_id, authentication_token, ip_address, device_type, login_time, browser, client_os, db_link) FROM stdin;
5	4	2r2xp1q5rzpnu3syn3vwrsoowsy1x0or	192.168.1.110	desktop	2015-07-30 15:49:15.398	Chrome 42.0.2311.152	Linux x86_64	
\.


--
-- Name: cams_login_master_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_login_master_id_seq', 5, true);


--
-- Data for Name: cams_mail; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_mail (mail_id, recipient, sender, date_time, mail_type, info) FROM stdin;
\.


--
-- Data for Name: cams_mail_site_scheduler; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_mail_site_scheduler (mail_site_scheduler_id, site_id, hour, isactive) FROM stdin;
\.


--
-- Data for Name: cams_module_emp_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_module_emp_mapping (module_emp_mapping_id, emp_id, module_client_mapping_id, is_active, created_date, created_by, updated_date, updated_by, site_id) FROM stdin;
5	4	1	t	2013-12-03	4	2014-10-13	4	1
6	4	2	t	2013-12-05	4	2014-10-13	4	1
\.


--
-- Data for Name: cams_module_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_module_master (module_id, module_name, module_added_date, module_added_by, module_mapped_users) FROM stdin;
1	WFCM	2013-12-02	1	100
2	ADMIN	2013-09-11	1	100
\.


--
-- Data for Name: cams_module_resource_designation_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_module_resource_designation_mapping (module_resource_designation_mapping_id, module_id, resource_id, designation_id, is_active) FROM stdin;
\.


--
-- Name: cams_module_resource_designation_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_module_resource_designation_mapping_id_seq', 1, false);


--
-- Data for Name: cams_module_resource_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_module_resource_mapping (module_resource_mapping_id, resource_id, module_client_mapping_id) FROM stdin;
\.


--
-- Name: cams_module_tab_adhocrole_map_cams_module_tab_adhocrole_map_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_module_tab_adhocrole_map_cams_module_tab_adhocrole_map_seq', 82, true);


--
-- Data for Name: cams_module_tab_adhocrole_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_module_tab_adhocrole_mapping (cams_module_tab_adhocrole_mapping_id, module_id, tab_id, adhoc_role_id, is_active, child_tab, site_id) FROM stdin;
27	1	5	2	t	inactivate	1
28	1	10	2	t	inductiontraining_uploadinductiontraining_upload|inductiontraining_uploadinductiontraining_create|inductiontraining_uploadinductiontraining_view|inductiontraining_uploadinductiontraining_edit|inductiontraining_createinductiontraining	1
29	1	11	2	t	mytraining	1
31	1	13	2	t	viewmapping_category|viewmapping_employee	1
32	1	14	2	t	hodtab_jobdescription_create|hodtab_jobdescription_edit|hodtab_jobdescription_jdviewbyversion|hodtab_statusgraph|hodtab_waiveoff|hodtab_blockedtest	1
33	1	15	2	t	mandatorytraining	1
34	1	17	2	t	functioncreation	1
36	1	19	2	t	functionmapping_create|functionmapping_edit	1
37	1	20	2	t	createtrainer	1
40	1	23	2	t	adhoctraining	1
41	1	24	2	t	myjobdescription	1
43	2	1	2	t	employee_create|employee_view|employee_edit	1
44	2	2	2	t	designationmapping_view|designationmapping_edit	1
45	2	3	2	t	designationcategory	1
46	2	4	2	t	adminconfiguration_sop|adminconfiguration_mailscheduledday|adminconfiguration_email|adminconfiguration_changepassword	1
47	2	6	2	t	audit	1
48	2	7	2	t	moduleregistration	1
49	2	8	2	t	permission	1
50	2	9	2	t	departmentutility	1
52	1	26	2	t	employeestatus	1
54	2	2	4	f	\N	1
55	2	3	4	f	\N	1
56	2	4	4	f	\N	1
57	2	6	4	f	\N	1
58	2	7	4	f	\N	1
59	2	8	4	f	\N	1
60	2	9	4	f	\N	1
53	2	1	4	t	employee_view	1
62	1	5	4	f	\N	1
63	1	10	4	f	\N	1
64	1	12	4	f	\N	1
65	1	13	4	f	\N	1
66	1	14	4	f	\N	1
68	1	17	4	f	\N	1
70	1	19	4	f	\N	1
71	1	20	4	f	\N	1
72	1	21	4	f	\N	1
73	1	22	4	f	\N	1
74	1	23	4	f	\N	1
77	1	26	4	f	\N	1
78	1	11	4	t	mytraining	1
67	1	15	4	t	mandatorytraining	1
75	1	24	4	t	myjobdescription	1
38	1	21	2	t	classroomtraining|classroomtraining_view	1
39	1	22	2	t	adhoctrainingtopic	1
42	1	25	2	t	report_trainingtranscription|report_adminreport|pending_training|report_by_role|effective_sop_report	1
79	2	27	2	t	site	1
76	1	25	4	t	report_trainingtranscription	1
69	1	18	4	t	approval_JobDescription	1
35	1	18	2	t	approval_function|approval_JobDescription|approval_sop|approval_induction	1
81	1	29	2	f	sop_view_report	1
82	1	30	2	f	sop_function_mapping	1
30	1	12	2	t	sopmanagement_category|sopmanagement_sopupload|sopmanagement_finalsopupload|sopmanagement_training|sopmanagement_sopfunmapping|sopmanagement_sopviewreport	1
\.


--
-- Data for Name: cams_module_tab_designation_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_module_tab_designation_mapping (module_tab_designation_mapping_id, module_id, tab_id, designation_id, is_active) FROM stdin;
\.


--
-- Name: cams_module_tab_designation_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_module_tab_designation_mapping_id_seq', 1, false);


--
-- Data for Name: cams_module_tab_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_module_tab_mapping (module_tab_mapping_id, tab_id, module_client_mapping_id) FROM stdin;
3	5	1
4	10	1
5	11	1
6	12	1
7	13	1
8	14	1
9	15	1
10	17	1
11	19	1
12	20	1
13	21	1
14	22	1
15	23	1
16	24	1
17	25	1
18	26	1
19	1	2
20	2	2
21	3	2
22	4	2
23	6	2
24	7	2
25	8	2
26	9	2
28	18	1
29	27	2
31	29	1
32	30	1
\.


--
-- Data for Name: cams_pending_mail; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_pending_mail (mail_id, date_of_mail_failure, mail_recipient, mail_subject, mail_content) FROM stdin;
\.


--
-- Data for Name: cams_permission_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_permission_master (id, permission_type) FROM stdin;
1	TAKE_TEST
2	CREATE_EMP
3	UPLOAD_SOP
\.


--
-- Name: cams_permission_master_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_permission_master_id_seq', 3, true);


--
-- Data for Name: cams_pwd_answer; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_pwd_answer (emp_id, pwd_question_id, answer) FROM stdin;
\.


--
-- Data for Name: cams_pwd_question_mstr; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_pwd_question_mstr (pwd_question_id, question_name, answer) FROM stdin;
\.


--
-- Data for Name: cams_resource_emp_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_resource_emp_mapping (resource_emp_mapping_id, module_resource_mapping_id, emp_id, access, status) FROM stdin;
\.


--
-- Data for Name: cams_resource_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_resource_master (resource_id, resource_name, filename, icon, panelid, is_active) FROM stdin;
\.


--
-- Data for Name: cams_site_deparment_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_site_deparment_mapping (site_dept_mpng_id, site_id, dept_id, dept_head, is_active, deactivated_by, deactivation_comment) FROM stdin;
2	1	1	4	t	\N	\N
\.


--
-- Data for Name: cams_site_department_designation_group_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_site_department_designation_group_mapping (site_dept_desig_group_id, site_id, dept_id, desig_id, group_id, deactivated_by, deactivation_comment, is_active) FROM stdin;
10	1	1	1	1	\N	\N	t
\.


--
-- Data for Name: cams_site_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_site_master (site_id, site_name, site_location, isactive, phone_number, address, fax_no, city, site_state, country, pincode, short_name) FROM stdin;
1	DiscusIT	Saprem	t	9099407408	Mithakali	9099407408	Ahemdabad	Gujarat	India	38001	DiscusIT
\.


--
-- Data for Name: cams_tab_designation_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_tab_designation_mapping (tab_desig_maping_id, desig_id, tab_id, status) FROM stdin;
\.


--
-- Data for Name: cams_tab_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_tab_master (tab_id, tab_name, filename, is_active, index, child_tab) FROM stdin;
1	Employee	EmployeUtility.zul	t	5	employee_create|employee_view|employee_edit
3	Designation Category	DesignationGroup.zul	t	2	designationcategory
4	Admin Configuration	AdminConfiguration.zul	t	9	adminconfiguration_sop|adminconfiguration_mailscheduledday|adminconfiguration_email|adminconfiguration_changepassword
5	Inactivate	InactiveUtility.zul	t	14	inactivate
6	Audit	AuditTrail.zul	t	7	audit
9	Department	DepartmentUtility.zul	t	1	departmentutility
10	Induction training	InductionTrainingTab.zul	t	1	inductiontraining_uploadinductiontraining_upload|inductiontraining_uploadinductiontraining_create|inductiontraining_uploadinductiontraining_view|inductiontraining_uploadinductiontraining_edit|inductiontraining_createinductiontraining
11	My Training	TrainingTab.zul	t	9	mytraining
15	Mandatory Training	RegulatoryTraining.zul	t	2	mandatorytraining
19	Function Mapping	EmployeeFunctionMapping.zul	t	8	functionmapping_create|functionmapping_edit
20	Create Trainer	Trainer.zul	t	11	createtrainer
22	Adhoc Training Topic	AdhocTrainingTopic.zul	t	12	adhoctrainingtopic
23	Adhoc Training	AdhocTraining.zul	t	13	adhoctraining
24	My Job Description	MyJobDescription.zul	t	4	myjobdescription
26	Employee Status	EmployeeStatus.zul	t	17	employeestatus
2	Designation Mapping	DesignationUtility.zul	t	3	designationmapping_view|designationmapping_edit
21	Class Room Training	SOPTrainingAttendence.zul	t	10	classroomtraining|classroomtraining_view
17	Function Code Creation	FunctionalUtility.zul	t	5	functioncreation
25	Report	ReportTab.zul	t	15	report_trainingtranscription|report_adminreport|pending_training|report_by_role|effective_sop_report
27	site	SiteUtility.zul	t	0	site
8	Roles & Permissions	PermissionsMaster.zul	t	4	permission
7	Module Registration & Roles	UserModuleRegistration.zul	t	6	moduleregistration
13	View Mapping	CategorySOPReport.zul	t	18	viewmapping_category|viewmapping_employee
14	Head of Department	HODTab.zul	t	3	hodtab_jobdescription_create|hodtab_jobdescription_edit|hodtab_jobdescription_jdviewbyversion|hodtab_statusgraph|hodtab_waiveoff|hodtab_blockedtest|hodtab_trainingcertificate
18	Approval	FunctionalApproval.zul	t	7	approval_function|approval_JobDescription|approval_sop|approval_induction
12	SOP Management	SopManagement.zul	t	6	sopmanagement_category|sopmanagement_sopupload|sopmanagement_finalsopupload|sopmanagement_training|sopmanagement_sopfunmapping|sopmanagement_sopviewreport
29	SOP View Report	SOPViewReport.zul	f	19	sop_view_report
30	SOP Function Mapping	SopFunctionMapping.zul	f	35	sop_function_mapping
\.


--
-- Data for Name: cams_translation; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_translation (id, translation_key, translation_value, translation_language) FROM stdin;
1	qms_login_username	Username	en
2	qms_login_password	Password	en
3	qms_login_username	USERNAME	fr
4	qms_login_password	PASSWORD	fr
\.


--
-- Name: cams_translation_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_translation_id_seq', 4, true);


--
-- Data for Name: cams_user_task; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_user_task (id, created_on, title, description, module_name, actions, status, site_id, resource_key) FROM stdin;
20	2014-09-20 14:33:36.28	Function_Mapping	Complete function mapping for Maulik  Modi	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/EmployeeFunctionMapping.zul","data":{}}]}	1	1	\N
15	2014-09-20 13:31:34.74	Induction_Training	Complete induction training for Maulik Modi	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/InductionTrainingTab.zul","data":{}}]}	1	1	\N
17	2014-09-20 14:13:39.284	SOP_Approval	SOP Approval pending for DIS-101	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/FunctionalApproval.zul","data":{}}]}	1	1	\N
19	2014-09-20 14:31:52.984	SOP_Approval	SOP Approval pending for MUM-101	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/FunctionalApproval.zul","data":{}}]}	1	2	\N
5	2014-09-16 16:16:30.428	Induction_Training	Complete induction training for Tushar Makwana	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/InductionTrainingTab.zul","data":{}}]}	1	1	\N
16	2014-09-20 13:33:06.967	Create_Job_Description	Create job description for Maulik	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/JobDescription.zul","data":{}}]}	1	1	\N
7	2014-09-16 18:56:32.874	Create_Job_Description	Create job description for Tushar	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/JobDescription.zul","data":{}}]}	1	1	\N
8	2014-09-17 15:06:11.918	Accept_Job_Description	Review & accept your job description	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/FunctionalApproval.zul","data":{}}]}	1	1	\N
9	2014-09-17 15:12:44.521	Finalize_Job_Description	Finalize job description for  Tushar  Makwana	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/JobDescription.zul","data":{}}]}	1	1	\N
11	2014-09-17 16:09:56.179	Function_Approval	Function Approval pending for DIS_FUN	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/FunctionalApproval.zul","data":{}}]}	1	1	\N
12	2014-09-20 11:53:10.411	Function_Approval	Function Approval pending for DIS_POLICY	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/FunctionalApproval.zul","data":{}}]}	1	1	\N
13	2014-09-20 11:54:27.589	Function_Approval	Function Approval pending for DiscusIT_Mumbai_Fnction	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/FunctionalApproval.zul","data":{}}]}	1	2	\N
10	2014-09-17 15:19:12.615	Function_Mapping	Complete function mapping for Tushar  Makwana	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/EmployeeFunctionMapping.zul","data":{}}]}	1	1	\N
14	2014-09-20 12:00:26.965	Function_Mapping	Complete function mapping for Tushar  Makwana	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/EmployeeFunctionMapping.zul","data":{}}]}	0	1	\N
22	2014-09-20 18:14:57.54	Induction_Training	Complete induction training for Anurag Dadheech	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/InductionTrainingTab.zul","data":{}}]}	0	1	\N
18	2014-09-20 14:29:14.37	SOP_Training	Complete training for DIS-101A	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/TrainingTab.zul","data":{"SOP_VRSN_ID":6,"SELECTED_TRNG":"Discus Policy","TRNG_INFO":4,"TITLE":true}}]}	1	1	\N
21	2014-09-20 17:10:42.783	SOP_Training	Complete training for DIS-101	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/TrainingTab.zul","data":{"SOP_VRSN_ID":6,"SELECTED_TRNG":"Discus Policy","TRNG_INFO":5,"TITLE":true}}]}	1	1	\N
25	2014-09-22 14:06:09.025	SOP_Training	Complete training for DIS-101A	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/TrainingTab.zul","data":{"SOP_VRSN_ID":6,"SELECTED_TRNG":"Discus Policy","TRNG_INFO":8,"TITLE":true}}]}	1	1	\N
24	2014-09-22 11:27:37.27	Create_Job_Description	Create job description for Sachin	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/JobDescription.zul","data":{}}]}	1	2	\N
23	2014-09-22 11:25:57.733	Induction_Training	Complete induction training for Sachin Patel	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/InductionTrainingTab.zul","data":{}}]}	1	1	\N
26	2014-09-22 14:07:52.456	Function_Mapping	Complete function mapping for Sachin  Patel	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/EmployeeFunctionMapping.zul","data":{}}]}	1	2	\N
27	2014-09-22 14:08:05.504	SOP_Training	Complete training for MUM-101A	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/TrainingTab.zul","data":{"SOP_VRSN_ID":7,"SELECTED_TRNG":"Mumbai Policy","TRNG_INFO":9,"TITLE":true}}]}	0	2	\N
28	2014-09-23 12:25:16.184	Induction_Training	Complete induction training for Ankit Makwana	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/InductionTrainingTab.zul","data":{}}]}	0	1	\N
35	2014-09-23 16:52:04.308	Function_Mapping	Complete function mapping for Pooja  Visavadia	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/EmployeeFunctionMapping.zul","data":{}}]}	1	2	\N
32	2014-09-23 15:38:47.07	Induction_Training	Complete induction training for Pooja Visavadia	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/InductionTrainingTab.zul","data":{}}]}	1	2	\N
36	2014-09-23 16:53:29.782	SOP_Training	Complete training for MUM-101A	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/TrainingTab.zul","data":{"SOP_VRSN_ID":7,"SELECTED_TRNG":"Mumbai Policy","TRNG_INFO":10,"TITLE":true}}]}	0	2	\N
34	2014-09-23 16:50:39.032	SOP_Approval	SOP Approval pending for MUM-102	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/FunctionalApproval.zul","data":{}}]}	1	2	\N
33	2014-09-23 16:46:48.409	Create_Job_Description	Create job description for Pooja	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/JobDescription.zul","data":{}}]}	1	2	\N
37	2014-09-23 16:53:29.975	SOP_Training	Complete training for MUM-102A	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/TrainingTab.zul","data":{"SOP_VRSN_ID":8,"SELECTED_TRNG":"Mumbai-102","TRNG_INFO":11,"TITLE":true}}]}	1	2	\N
38	2014-09-23 16:58:06.537	SOP_Approval	SOP Approval pending for DIS-102	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/FunctionalApproval.zul","data":{}}]}	1	1	\N
31	2014-09-23 15:38:46.729	Induction_Training	Complete induction training for Pooja Visavadia	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/InductionTrainingTab.zul","data":{}}]}	1	1	\N
39	2014-09-23 17:07:41.777	Create_Job_Description	Create job description for Pooja	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/JobDescription.zul","data":{}}]}	1	1	\N
40	2014-09-23 17:08:17.051	Accept_Job_Description	Review & accept your job description	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/FunctionalApproval.zul","data":{}}]}	1	1	\N
41	2014-09-23 18:35:56.651	Finalize_Job_Description	Finalize job description for  Pooja  Visavadia	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/JobDescription.zul","data":{}}]}	1	1	\N
42	2014-09-23 18:36:20.883	Function_Mapping	Complete function mapping for Pooja  Visavadia	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/EmployeeFunctionMapping.zul","data":{}}]}	1	1	\N
43	2014-09-23 18:36:45.253	SOP_Training	Complete training for DIS-102A	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/TrainingTab.zul","data":{"SOP_VRSN_ID":9,"SELECTED_TRNG":"Mobile Policy","TRNG_INFO":12,"TITLE":true}}]}	0	1	\N
57	2014-10-02 16:10:27.739	Create_Job_Description	Create job description for Nitesh	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/JobDescription.zul","data":{}}]}	1	1	\N
50	2014-09-24 11:52:44.73	Induction_Training	Complete induction training for Pratik Oza	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/InductionTrainingTab.zul","data":{}}]}	1	2	\N
51	2014-09-24 12:03:41.795	Create_Job_Description	Create job description for Pratik	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/JobDescription.zul","data":{}}]}	0	2	\N
49	2014-09-24 11:52:44.437	Induction_Training	Complete induction training for Pratik Oza	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/InductionTrainingTab.zul","data":{}}]}	1	1	\N
52	2014-09-24 12:18:43.111	Create_Job_Description	Create job description for Pratik	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/JobDescription.zul","data":{}}]}	1	1	\N
53	2014-09-24 18:12:48.421	Function_Mapping	Complete function mapping for Pratik  Oza	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/EmployeeFunctionMapping.zul","data":{}}]}	0	1	\N
58	2014-10-02 16:13:11.934	Accept_Job_Description	Review & accept your job description	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/FunctionalApproval.zul","data":{}}]}	1	1	\N
55	2014-10-02 16:08:58.597	Induction_Training	Complete induction training for Nitesh Sharma	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/InductionTrainingTab.zul","data":{}}]}	1	2	\N
62	2014-10-02 17:02:25.63	SOP_Training	Complete training for DIS-101A	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/TrainingTab.zul","data":{"SOP_VRSN_ID":6,"SELECTED_TRNG":"Discus Policy","TRNG_INFO":13,"TITLE":true}}]}	1	1	\N
54	2014-10-02 16:08:58.49	Induction_Training	Complete induction training for Nitesh Sharma	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/InductionTrainingTab.zul","data":{}}]}	1	1	\N
59	2014-10-02 16:16:04.669	Finalize_Job_Description	Finalize job description for  Nitesh  Sharma	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/JobDescription.zul","data":{}}]}	1	1	\N
56	2014-10-02 16:10:00.285	Create_Job_Description	Create job description for Nitesh	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/JobDescription.zul","data":{}}]}	1	2	\N
60	2014-10-02 16:58:45.512	Function_Mapping	Complete function mapping for Nitesh  Sharma	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/EmployeeFunctionMapping.zul","data":{}}]}	1	1	\N
63	2014-10-02 17:02:25.744	SOP_Training	Complete training for DIS-102A	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/TrainingTab.zul","data":{"SOP_VRSN_ID":9,"SELECTED_TRNG":"Mobile Policy","TRNG_INFO":14,"TITLE":true}}]}	0	1	\N
61	2014-10-02 16:59:27.472	Function_Mapping	Complete function mapping for Nitesh  Sharma	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/EmployeeFunctionMapping.zul","data":{}}]}	1	2	\N
64	2014-10-02 17:02:56.114	SOP_Training	Complete training for MUM-101A	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/TrainingTab.zul","data":{"SOP_VRSN_ID":7,"SELECTED_TRNG":"Mumbai Policy","TRNG_INFO":15,"TITLE":true}}]}	0	2	\N
65	2014-10-02 17:02:56.147	SOP_Training	Complete training for MUM-102A	WFCM	{"actionList":[{"name":"View","url":"~wfcm-web/WEB-INF/Desktop-Utilities/TrainingTab.zul","data":{"SOP_VRSN_ID":8,"SELECTED_TRNG":"Mumbai-102","TRNG_INFO":16,"TITLE":true}}]}	0	2	\N
\.


--
-- Data for Name: cams_user_task_assignes; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY cams_user_task_assignes (assign_id, task_id, task_type, owner) FROM stdin;
\.


--
-- Name: cams_user_task_assignes_assign_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_user_task_assignes_assign_id_seq', 145, true);


--
-- Name: cams_user_task_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('cams_user_task_id_seq', 65, true);


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('client_id_seq', 1, true);


--
-- Name: dept_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('dept_id_seq', 9, true);


--
-- Name: desig_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('desig_id_seq', 2, true);


--
-- Name: designation_group_maping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('designation_group_maping_id_seq', 3, true);


--
-- Name: doc_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('doc_id_seq', 18, true);


--
-- Name: emp_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('emp_id_seq', 18, true);


--
-- Name: emp_maping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('emp_maping_id_seq', 37, true);


--
-- Name: emp_pic_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('emp_pic_id_seq', 1, false);


--
-- Name: emp_role_maping_id; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('emp_role_maping_id', 1, false);


--
-- Name: emp_sop_training_maping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('emp_sop_training_maping_id_seq', 1, false);


--
-- Name: emp_tni_trainer_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('emp_tni_trainer_mapping_id_seq', 1, false);


--
-- Name: emp_training_attendance_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('emp_training_attendance_id_seq', 1, false);


--
-- Name: emp_trnr_certifcation_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('emp_trnr_certifcation_id_seq', 18, true);


--
-- Name: employee_sop_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('employee_sop_mapping_id_seq', 1, false);


--
-- Name: employee_tni_training_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('employee_tni_training_mapping_id_seq', 1, false);


--
-- Name: employee_training_certificate_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('employee_training_certificate_id_seq', 1, false);


--
-- Name: group_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('group_id_seq', 3, true);


--
-- Name: hr_department_trainer_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('hr_department_trainer_mapping_id_seq', 3, true);


--
-- Name: live_sop_test_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('live_sop_test_id_seq', 14, true);


--
-- Name: mail_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('mail_id_seq', 2, true);


--
-- Name: mail_site_scheduler_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('mail_site_scheduler_id_seq', 1, true);


--
-- Name: module_client_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('module_client_mapping_id_seq', 1, false);


--
-- Name: module_emp_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('module_emp_mapping_id_seq', 22, true);


--
-- Name: module_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('module_id_seq', 1, false);


--
-- Name: module_resource_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('module_resource_mapping_id_seq', 1, false);


--
-- Name: module_tab_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('module_tab_mapping_id_seq', 32, true);


--
-- Name: pwd_question_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('pwd_question_id_seq', 1, false);


--
-- Name: resource_emp_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('resource_emp_mapping_id_seq', 1, false);


--
-- Name: resource_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('resource_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('role_id_seq', 1, false);


--
-- Name: seq_user_tasks; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('seq_user_tasks', 1, false);


--
-- Name: site_dept_desig_group_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('site_dept_desig_group_id_seq', 13, true);


--
-- Name: site_dept_mpng_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('site_dept_mpng_id_seq', 14, true);


--
-- Name: site_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('site_id_seq', 2, true);


--
-- Name: sop_approval_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_approval_id_seq', 1, false);


--
-- Name: sop_blocked_test_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_blocked_test_id_seq', 1, false);


--
-- Name: sop_category_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_category_id_seq', 4, true);


--
-- Name: sop_category_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_category_mapping_id_seq', 9, true);


--
-- Name: sop_department_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_department_mapping_id_seq', 1, false);


--
-- Name: sop_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_id_seq', 9, true);


--
-- Name: sop_image_master_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_image_master_id_seq', 15, true);


--
-- Name: sop_media_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_media_id_seq', 1, false);


--
-- Name: sop_question_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_question_id_seq', 4, true);


--
-- Name: sop_question_option_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_question_option_id_seq', 16, true);


--
-- Name: sop_site_department_group_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_site_department_group_mapping_id_seq', 1, false);


--
-- Name: sop_test_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_test_id_seq', 8, true);


--
-- Name: sop_training_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_training_id_seq', 16, true);


--
-- Name: sop_version_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('sop_version_id_seq', 9, true);


--
-- Data for Name: stgemployee; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY stgemployee (empid, salutation, fname, mname, lname, contactno, qualification, experience, doj, email, department, desgination, roles1, roles2, certificate) FROM stdin;
85	Mr.	Anil	Manshukhlal	Chandarana	9979871296	B.Pharm & MBA	24	2/5/2013	anilc@amnealindia.com	Operation	Sr. GM	EMPLOYEE	\N	\N
63	Mr.	Prashant	Harish	Pawar	7600056692	M.Sc	9	1/3/2013	prashantp@amnealindia.com	Sterile manufacturing	Sr.Manager	EMPLOYEE	\N	\N
157	Mr.	Rahul	Manshanker	Bhatt	8000656046	B.Pharm	9	21/10/2013	rahulba@amnealindia.com	Sterile manufacturing	Asst. Manager	EMPLOYEE	\N	\N
275	Mr.	Vipulkumar	Pravinchandra	Darji	9979588049	B.Sc. Chemistry	9.6	2/6/2014	vipuld@amnealindia.com	Sterile manufacturing	Asst. Manager	EMPLOYEE	\N	\N
257	Mr.	Mrinal	Kanti	Samanta	9904121817	B.Pharm	8.6	12/5/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Sr.Executive	EMPLOYEE	\N	\N
65	Mr.	Harshad	Bhailalbhai	Shrimali	9662549713	B.Pharm	8.3	11/3/2013	Sezproduction@amnealindia.com	Sterile manufacturing	Sr.Executive	EMPLOYEE	\N	\N
48	Mr.	Vrushank	Haribhai	Patel	9925786565	B.Pharm	5.1	24/1/2013	Sezproduction@amnealindia.com	Sterile manufacturing	Sr.Executive	EMPLOYEE	\N	\N
289	Mr.	Kunal	Mukundbhai	Patel	7600349592	M.S In Pharmaceutical manufacturing	6	23/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Sr.Executive	EMPLOYEE	\N	\N
122	Mr.	Krunal	Kishorbhai	Mehta	9624700774	B.Pharm	6.1	10/6/2013	Sezproduction@amnealindia.com	Sterile manufacturing	Executive	EMPLOYEE	\N	\N
249	Mr.	Mitesh	Mahendrasinh	Zala	9712436331	B.Pharm	7.6	21/4/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Executive	EMPLOYEE	\N	\N
183	Mr.	Urvish	Maheshbhai	Jobanputra	9879444440	M.Pharm	2	2/1/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Executive	EMPLOYEE	\N	\N
154	Mr.	Ashish	Surendrakumar	Gaur	9033449538	B.Pharm	5.3	10/10/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Executive	EMPLOYEE	\N	\N
220	Mr.	Vipul	Parshotambhai	Rokad	8347356300	M.Pharm	1.1	3/3/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Executive	EMPLOYEE	\N	\N
187	Mr.	Nikunj	Jentilal	Kalariya	9510202022	M.Pharm	1.11	6/1/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Executive	EMPLOYEE	\N	\N
239	Mr.	Manthan	Ashokbhai	Padalia	8469415169	B.Pharm/M.Sc in Formulation	3.7	24/3/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Sr.Officer	EMPLOYEE	\N	\N
141	Mr.	Nikesh	Rasikbhai	Mistry	9925672615	B.Pharm	6	1/8/2013	Sezproduction@amnealindia.com	Sterile manufacturing	Sr.Officer	EMPLOYEE	\N	\N
128	Mr.	Anil	Vishnubhai	Patel	9601063534	B.Pharm	2.6	4/7/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
15	Mr.	Vishnukumar	Ashokkumar	Khamar	9173439903	S.S.C.(I.T.I)	16.8	10/9/2012	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
194	Mr.	Dharmesh	Jayntibhai	Patel	9099787974	B.Pharm	2	20/1/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
200	Mr.	Ankur	Rajnikant	Patel	9726810708	B.Pharm	4.6	10/2/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Sr.Officer	EMPLOYEE	\N	\N
FT-00031	Mr.	Kishorsinh	Ranjitsinh	Gohil	9016750287	B.Pharm	0	19/5/2014	Sezproduction@amnealindia.com	Sterile manufacturing	FTE	EMPLOYEE	\N	\N
FT-00030	Mr.	Chetan	Shankarbhai	Patel	8128388674	B.Pharm	0	19/5/2014	Sezproduction@amnealindia.com	Sterile manufacturing	FTE	EMPLOYEE	\N	\N
FT-00029	Mr.	Ankit    	Amrutbhai	Desai	9714587358	B.Pharm	0	19/5/2014	Sezproduction@amnealindia.com	Sterile manufacturing	FTE	EMPLOYEE	\N	\N
284	Mr.	Ankur	Bharatbhai	Raval	9429228119	B.Pharm	4.9	23/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Sr.Officer	EMPLOYEE	\N	\N
292	Mr.	Pintu	Babulal	Patel	9624062516	B.Pharm	1.6	23/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Trainee	EMPLOYEE	\N	\N
97	Mr.	Suhag	Girishbhai	Patel	9979504576	S.S.C & I.T.I	6.3	10/5/2013	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
92	Mr.	Vanrajsinh	Samantsinh	Vaghela	7383938492	S.S.C & I.T.I	11.4	6/5/2013	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
96	Mr.	Pratik	Vithalbhai	Patel	9558533058	H.S.C & I.T.I	8.3	10/5/2013	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
102	Mr.	Arvind	Damodarbhai	Valand	9724484700	B.A.	3.6	20/5/2013	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
263	Mr.	Suresh	Bhikhabhai	Parmar	8733880159	S.S.C	6	19/5/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
269	Mr.	Mitesh	Arvindbhai	Valand	9574900335	H.S.C & I.T.I	0	2/1/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
98	Mr.	Sanjay	Garib	Rajbhar	8866737740	S.S.C	7.2	14/5/2013	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
99	Mr.	Satewant	Kamtha	Aryas	9510659810	B.Sc	6.6	14/5/2013	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
182	Mr.	Pratik	Navinbhai	Patel	9898290505	H.S.C & I.T.I	8.3	2/1/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
189	Mr.	Prahlad	Tulsidas	Rathod	9601730680	H.S.C	6.9	16/1/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
195	Mr.	Indresh	Mithilesh	Mall	9409603083	I.T.I	5	20/1/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
261	Mr.	Jashvant	Ratilal	Makwana	8347468826	H.S.C & I.T.I	3.6	19/5/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
262	Mr.	Sanjay	Vikrambhai	Chauhan	9033772402	H.S.C & I.T.I	3.6	19/5/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
260	Mr.	Ghanshyam	Baldevbhai	Thakor	9173965226	H.S.C & I.T.I	4	19/5/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
259	Mr.	Ashok	Rameshbhai	Nayak	9157537896	S.S.C & I.T.I	10	19/5/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
210	Mr.	Rajnikant	Chandubhai	Patel	9427939435	S.S.C & I.T.I	4	24/2/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
246	Mr.	Ketan	Kantilal	Patel	9714089852	I.T.I Elec.	14	14/4/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
274	Mr.	Pradip	Kanibhai	Parmar	9824118512	S.S.C & I.T.I	3	2/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
273	Mr.	Pankaj	Bhikhabhai	Lakum	8485910492	S.S.C & I.T.I	3.5	2/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
279	Mr.	Hitesh	Rameshbhai	Prajapati	9558748456	S.S.C & I.T.I	1.8	9/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
126	Mr.	Lalji	Parsottambhai	Dodiya	9979090567	ITI-Fitter	9	30/6/2014	sezeng@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
286	Mr.	Dharmendra	Ramanlal	Barot	7383354755	B.A & I.T.I	4	23/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
293	Mr.	Shrinivas	Siddrambhai	Karli	9998714435	S.S.C. & I.T.I	5	23/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
290	Mr.	Mukesh	Virabhai	Makwana	7698518493	H.S.C &I .T.I	6.6	23/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
285	Mr.	Bhavik	Govindlal	Patel	9824937444	S.S.C. & I.T.I	5	23/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
287	Mr.	Haresh	Hashmukhbhai	Patel	8155055942	B.A & Diploma in Elec.	2.6	23/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
294	Mr.	Digvijay	Bapalal	Chudasama	9687626373	H.S.C. & I.T.I	5.6	30/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
265	Mr.	Kalpesh 	Haribhai	Prajapati	9725679880	H.S.C & I.T.I	0	30/6/2014	Sezproduction@amnealindia.com	Sterile manufacturing	Officer	EMPLOYEE	\N	\N
217	Mr.	Rajesh	Ishvarbhai	Mandli	8866292936	Diploma-Electrical	8.5	30/6/2014	rakeshs@amnealindia.com	Maintainance	Officer	EMPLOYEE	\N	\N
248	Mr.	Gaurang	Babubhai	Patel	9925703070	ITI-Refrigeration	14	30/6/2014	rakeshs@amnealindia.com	Maintainance	Associate	EMPLOYEE	\N	\N
41	Mr.	Vasudev	Jivabhai	Chauhan	9909363330	SSC	12.2	30/6/2014	rakeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
109	Mr.	Harshad	Balubhai	Jadav	9724499251	ITI-Electronics	2.5	30/6/2014	rakeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
37	Mr.	Vasant	Govind bhai	Valand	8128057101	ITI-Refrigeration	10.3	30/6/2014	rakeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
72	Mr.	Ashwin	Jayantibhai	Patel	9904097197	ITI-Refrigeration	7.5	30/6/2014	rakeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
38	Mr.	Yagnik	Manubhai	Patel	9898573514	ITI-Welder	4.8	30/6/2014	rakeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
223	Mr.	Jaydeep	Pravinbhai	Patel	9978203555	ITI-Motor mechanic	4.7	30/6/2014	rakeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
546	Mr.	Bhavesh 	Kishorbhai	Bhatt	9979097030	B.E. (Instrumentation)	10	30/6/2014	bhaveshb@amnealindia.com	Maintainance	Asst. Manager	EMPLOYEE	\N	\N
77	Mr.	Rahul 	Arvindkumar	Nayak	9724506702	B.E. (Instrumentation)	9	30/6/2014	bhaveshb@amnealindia.com	Maintainance	Sr.Executive	EMPLOYEE	\N	\N
17	Mr.	Gaurang	Yogeshbhai	Panchal	9825412708	Diploma-Electrical	10.9	30/6/2014	gaurangp@amnealindia.com	Maintainance	Sr.Executive	EMPLOYEE	\N	\N
51	Mr.	Priyank	Navinbhai	Patel	9925432089	Diploma-Mechanical	16	30/6/2014	gaurangp@amnealindia.com	Maintainance	Officer	EMPLOYEE	\N	\N
50	Mr.	Mahendrasinh	Kalyansinh	Rawal	9601651643	ITI-Electrical	12	30/6/2014	gaurangp@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
46	Mr.	Dashrathsinh	Gulabsinh	Zala	9924888125	ITI-Fitter	6.5	30/6/2014	gaurangp@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
66	Mr.	Dilip	Rameshbhai	Patel	8758689299	ITI-Fitter	4.2	30/6/2014	gaurangp@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
39	Mr.	Yashpalsinh	Bharatsinh	Thakor	9687541622	ITI-Electrical	6.1	30/6/2014	gaurangp@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
108	Mr.	Bhargav 	Kevaldas	Patel	9714134293	ITI-Instrumentation	3.5	30/6/2014	gaurangp@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
62	Mr.	Rakesh	Kumar	Shekhar	7600056896	Diploma- Electrical Power System	14	30/6/2014	rakeshs@amnealindia.com	Maintainance	Sr.Manager	EMPLOYEE	\N	\N
10	Mr.	Dilpesh	Pareshkumar	Shah	999847582	Diploma-Mechanical Engg.	12	30/6/2014	dilpeshs@amnealindia.com	Maintainance	Sr.Executive	EMPLOYEE	\N	\N
53	Mr.	Subhashchandra	Haribhai	Barot	9904413891	B.A	9	30/6/2014	dilpeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
81	Mr.	Amitkumar	Lallubhai	Patel	9974820644	ITI-Fitter	5	30/6/2014	dilpeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
82	Mr.	Babubhai	Dahyabhai	Parmar	9558218727	M.A-B.ED.	12	30/6/2014	dilpeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
86	Mr.	Babubhai	Bipinbhai	Makwana	9624479551	B.A	9	30/6/2014	dilpeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
119	Mr.	Narendrasinh	Mahendrabhai	Vaghela	9558867268	12th 	6	30/6/2014	dilpeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
120	Mr.	Vijay	Ranchhodbhai	Beldar	8140376996	10th 	4	30/6/2014	dilpeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
466	Mr.	Jitendra	Rameshchandra	Tiwari	9726266817	B.A & ITI-Fitter	6	30/6/2014	dilpeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
245	Mr.	Ganesh	Ladhubhai	Oganiya	9723256550	ITI-Fitter	12	30/6/2014	dilpeshs@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
471	Mr.	Vasant	Mafatlal	Patel	8511148484	B.Tech-Electrical	17	30/6/2014	vasantp@amnealindia.com	Maintainance	Sr.Executive	EMPLOYEE	\N	\N
438	Mr.	Shailesh	Pragjeebhai	Kanzariya	9737279718	ITI-Electrical	7	30/6/2014	electricalsez@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
121	Mr.	Yashwant	Motiram	Makwana	8511381145	Diploma-Electrical	12	30/6/2014	electricalsez@amnealindia.com	Maintainance	Executive	EMPLOYEE	\N	\N
212	Mr.	Vipul	Kishorbhai	Rana	8511163566	Diploma-Electrical	12	30/6/2014	vipulr@amnealindia.com	Maintainance	Sr.Executive	EMPLOYEE	\N	\N
90	Mr.	Anand	Harshalbhai	Thakkar	8401072349	BE-Electrical & Electronics	2	30/6/2014	vipulr@amnealindia.com	Maintainance	Officer	EMPLOYEE	\N	\N
52	Mr.	Mithilesh	Boyelal	Khushwaha	7698415129	ITI-Electrical	11	30/6/2014	electricalsez@amnealindia.com	Maintainance	Sr. assitance	EMPLOYEE	\N	\N
31	Mr.	Rajeshbhai	Vasantray	Acharya	9909299658	ITI-Electrical	17	30/6/2014	electricalsez@amnealindia.com	Maintainance	Officer	EMPLOYEE	\N	\N
110	Mr.	Vijay	Naranbhai	Varia	8238551007	ITI-Draftsman	5	30/6/2014	sezeng@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
138	Mr.	Ashish	Santosh	Awasthi	9099041680	Diploma-Electrical	8.5	30/6/2014	ashisha@amnealinida.com	Maintainance	Manager	EMPLOYEE	\N	\N
83	Mr.	Shailendra	Govindprasad	Agrawal	851114094	BE-Mechanical	8	30/6/2014	sezeng@amnealindia.com	Maintainance	Executive	EMPLOYEE	\N	\N
445	Mr.	Jaymin	Ashokkumar	Pandya	9427003543	ITI-Fitter	14	30/6/2014	sezeng@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
22	Mr.	Dharmendra	Arvindbhai	Sevak	9726758733	ITI-Fitter	9	30/6/2014	sezeng@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
297	Mr.	Alpesh	Vadilal	Suthar	9714280166	ITI-Fitter	9	30/6/2014	sezeng@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
23	Mr.	Sandeep	Jamnalal	Patel	9601716111	ITI-Fitter	6.2	30/6/2014	sezeng@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
45	Mr.	Dashrath	Shamjibhai	Prajapati	9601716111	ITI-Fitter	3.5	30/6/2014	sezeng@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
113	Mr.	Amit	Bhupendrabhai	Sathvara	9624929606	ITI-Fitter	7	30/6/2014	sezeng@amnealindia.com	Maintainance	Assistance	EMPLOYEE	\N	\N
172	\N	Satish	Shamlal	Patil	8758420455	M. Pharm.	0.1	30/6/2014	satishp@amnealindia.com	Product Development	AGM	EMPLOYEE	\N	\N
104	\N	Nirav	Jayantibhai	Patel	8758773551	M. Pharm.	9	30/6/2014	niravp@amnealindia.com	Product Development	Sr.Manager	EMPLOYEE	\N	\N
56	\N	Kiran	Ramanlal	Chaudhri	8511149929	Ph. D	3.5	30/6/2014	kiranc@amnealindia.com	Product Development	Manager	EMPLOYEE	\N	\N
448	\N	Hardik	Janakbhai	Joshi	8511143421	M. Pharm.	7	30/6/2014	hardikj@amnealindia.com	Product Development	Manager	EMPLOYEE	\N	\N
155	\N	Prashant 	Sagarbhai 	Desai	9427072735	M. Pharm.	4	30/6/2014	sezfnd@amnealindia.com	Product Development	Executive	EMPLOYEE	\N	\N
181	\N	Parth	Dilipkumar	Shah	9898033934	M. Pharm.	2	30/6/2014	sezfnd@amnealindia.com	Product Development	Executive	EMPLOYEE	\N	\N
218	\N	Rashmi 	Anandkumar 	Goswami	9586683556	M. Pharm.	0.1	30/6/2014	sezfnd@amnealindia.com	Product Development	Trainee	EMPLOYEE	\N	\N
FT00019	\N	Babuji	Krishnaparsad	Kantu	9737169659	M. Pharm.	0	30/6/2014	sezfnd@amnealindia.com	Product Development	FTE	EMPLOYEE	\N	\N
173	\N	Pranav	Kirit	Shah	9825299294	M.Sc. &P.G.DOM	16.5	30/6/2014	pranavs@amnealindia.com	Analytical Research Development	DGM	EMPLOYEE	\N	\N
295	\N	Hitesh	Balubhai 	Patel	9428892443	M.Sc. Ph.D	13	30/6/2014	hiteshp@amnealindia.com	Analytical Research Development	AGM	EMPLOYEE	\N	\N
219	\N	Snehal 	Natverlal 	Vaghela	8347414142	M.Sc.	14.5	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Asst. Manager	EMPLOYEE	\N	\N
153	\N	Shella	Snarasimulu	Prahllada	9723729578	M.Sc.	8.5	30/6/2014	shellap@amnealindia.com	Analytical Research Development	Asst. Manager	EMPLOYEE	\N	\N
215	\N	Kedar 	Panchvadan	Desai	9925004851	M.Sc.	10	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Asst. Manager	EMPLOYEE	\N	\N
252	\N	Atit	Vinodkumar	Pandya	9909924527	M.Sc.	10	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Asst. Manager	EMPLOYEE	\N	\N
54	\N	Vishal	Ashok	Thorat	8511149930	M.Sc.	10	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Asst. Manager	EMPLOYEE	\N	\N
168	\N	Sagar 	Sureshbhai	Ranpariya	9925492198	M.Sc.	6	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Sr.Executive	EMPLOYEE	\N	\N
230	\N	Dinesh 	Govindbhai	Solanki	9825015976	M.Sc.	8	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Sr.Executive	EMPLOYEE	\N	\N
237	\N	Yogendra	Devendrabhai	Malvaniya	9173209779	M.Sc.	8	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Sr.Executive	EMPLOYEE	\N	\N
202	\N	Hitesh	Savjibhai	Patel	7567454478	M.Sc.	8.5	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Sr.Executive	EMPLOYEE	\N	\N
212	\N	Dhaval	Jitendrakumar	Thakker	9033596816	M.Sc.	3.5	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Executive	EMPLOYEE	\N	\N
242	\N	Ritesh	Sureshbhai	Gupta	9727713943	M.Sc. MBA	9	30/6/2014	shellap@amnealindia.com	Analytical Research Development	Sr.Executive	EMPLOYEE	\N	\N
204	\N	Sekhar	karanam	---	7874854789	M.sc.PGDIPR&PGD QA&RA	5.9	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Sr.Executive	EMPLOYEE	\N	\N
152	\N	Nitin	Anandrao	Pawar	9712928032	B.Sc.& PGD (Soft.Engg.) FDA Approved	12	30/6/2014	shellap@amnealindia.com	Analytical Research Development	Officer	EMPLOYEE	\N	\N
206	\N	Neha	Ashokbhai	Dave	9898016649	M.Sc.	8	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Sr.Executive	EMPLOYEE	\N	\N
185	\N	Milan	Mahendra	Patel	9408013518	M.Sc.	5	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Executive	EMPLOYEE	\N	\N
243	\N	Shilpa	Narendra	Upadhyay	9426771823	M.Sc	6	30/6/2014	shellap@amnealindia.com	Analytical Research Development	Sr.Executive	EMPLOYEE	\N	\N
163	\N	Chandu	Somatbhai	Dabhi	9428396840	M.Pharm	5	30/6/2014	snehalv@amnealindia.com	Analytical Research Development	Sr.Executive	EMPLOYEE	\N	\N
244	\N	Apar	Anshuman	Dholakia	7567082321	M.Sc. Phd. (Microbiology)	15	30/6/2014	apard@amnealindia.com	Regulatory Compliance	DGM	EMPLOYEE	\N	\N
87	\N	Chandrakant 	Rameshbhai	Patel	8469153551	M.Sc. Microbiology	5.1	30/6/2014	sezrc@amnealindia.com	Regulatory Compliance	Executive	EMPLOYEE	\N	\N
150	\N	Mitul	Rasikbhai	Vasnani	9909028499	M. Pharm	2	30/6/2014	sezrc@amnealindia.com	Regulatory Compliance	Executive	EMPLOYEE	\N	\N
298	\N	Pratikkumar	Maheshkumar	Panchal	9925033088	M. Pharm	1	30/6/2014	sezrc@amnealindia.com	Regulatory Compliance	Trainee	EMPLOYEE	\N	\N
226	\N	Tejaskumar	Rameshbhai	Patel	9909374069	M.C.A	4.11	30/6/2014	tejasp@amnealindia.com	Information Technology	Sr.Officer	EMPLOYEE	\N	\N
211	\N	Vivek	Rameshbhai	Mistry	9925006948	D.C.A	9	30/6/2014	vivekm@amnealindia.com	Information Technology	Officer	EMPLOYEE	\N	\N
167	\N	Narayan	Ramchandrarao	Saraf	9099952901	M.Com & DMM	16	30/6/2014	narayans@amnealindia.com	Material Management	Sr.Manager	EMPLOYEE	\N	\N
64	\N	Jayesh 	Somabhai	Patel	8511174074	B.Com	19	30/6/2014	jayeshp@amnealindia.com	Material Management	Asst. Manager	EMPLOYEE	\N	\N
80	\N	Nikesh	Mahendrakumar	Shah	9978919815	B.Sc.	21	30/6/2014	sezstores@amnealindia.com	Material Management	Sr.Executive	EMPLOYEE	\N	\N
79	\N	Dhaval	Bhanubhai	Patel	9824521997	B.Sc.	8	30/6/2014	sezstores@amnealindia.com	Material Management	Executive	EMPLOYEE	\N	\N
238	\N	Shailesh	Hariprasad	Pathak	9558948487	B.Sc. &D.Pharma &DMM	10	30/6/2014	sezstores@amnealindia.com	Material Management	Sr.Executive	EMPLOYEE	\N	\N
250	\N	Vinod	Girishbhai	Pancholi	8511121767	H.S.C. (Sciences)	9	30/6/2014	sezstores@amnealindia.com	Material Management	Officer	EMPLOYEE	\N	\N
3	\N	Pankaj	Chintubhai	Valand	9724263172	B.Com	4	30/6/2014	sezstores@amnealindia.com	Material Management	Officer	EMPLOYEE	\N	\N
2	\N	Rajubhai	Vishnubhai	Bhujade	9924984647	M.A.	10	30/6/2014	sezstores@amnealindia.com	Material Management	Officer	EMPLOYEE	\N	\N
280	\N	Jignesh	Hareydrabhai	Bhatt	9624017377	B.Com	13	30/6/2014	sezstores@amnealindia.com	Material Management	Officer	EMPLOYEE	\N	\N
57	\N	Arvindbhai	Kodarbhai	Valand	9904914545	ITI	18	30/6/2014	sezstores@amnealindia.com	Material Management	Officer	EMPLOYEE	\N	\N
332	\N	Darshan	Virendra	Acharya	7600048780	MBA (HR)	15	30/6/2014	darshan@amnealindia.com	Administration	Manager	EMPLOYEE	\N	\N
227	\N	Vipul	Kantilal	Shihora	9879173038	B.E & PGDIM & P.G.DOM	4	30/6/2014	vipuls@amnealindia.com	Administration	Executive	EMPLOYEE	\N	\N
277	\N	Hardik	Kanubhai	Bhatt	9925108129	MBA   	0	30/6/2014	hardikb@amnealindia.com	Administration	Executive	EMPLOYEE	\N	\N
\N	\N	Yogesh	Kanubhai	Patel	9099642410	B.com	10	30/6/2014	darshan@amnealindia.com	Administration	Officer	EMPLOYEE	\N	\N
1095	\N	Jaypal	kiritbhai	Rathod	9099068955	F.Y (continue)	7	30/6/2014	darshan@amnealindia.com	Administration	Officer	EMPLOYEE	\N	\N
116	\N	Ashokkumar	Jagadishprasad	Prajapati	617	M.Sc.  chemistry	8	30/6/2014	rajeshk@amnealindia.com	Quality control Chemical	Executive	EMPLOYEE	\N	\N
130	\N	Rajesh	Kumar	Bollisetty	617	M.Sc.  chemistry	11	30/6/2014	rajeshk@amnealindia.com	Quality control Chemical	Manager	EMPLOYEE	\N	\N
91	\N	Bhaveshkumar	Somabhai	Patel	617	M.Sc.  chemistry	8	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Executive	EMPLOYEE	\N	\N
268	\N	Kishor	Purshottambhai	Panchal	617	M.Sc. Material Science	10	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Sr.Executive	EMPLOYEE	\N	\N
216	\N	Nilesh	Girishbhai	Gadani	617	M.Sc. Organic chemistry	13	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Asst. Manager	EMPLOYEE	\N	\N
258	\N	Rajesh	Devrajbhai	Patel	619	M.Sc. Organic chemistry	17.7	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Manager	EMPLOYEE	\N	\N
58	\N	Bhavesh	Bhanukant	Shah	617	M.Sc. Chemistry	20	30/6/2014	sbhavesh@amnealindia.com	Quality control Chemical	Manager	EMPLOYEE	\N	\N
142	\N	Shiny	Ravindran	0	617	PhD.[Organic Chemistry]	7	30/6/2014	sbhavesh@amnealindia.com	Quality control Chemical	Sr.Executive	EMPLOYEE	\N	\N
151	\N	Arvind	Bhikhabhai	Oza	617	M.Sc. Organic chemistry	14	30/6/2014	sbhavesh@amnealindia.com	Quality control Chemical	Sr.Executive	EMPLOYEE	\N	\N
FT-00032	\N	Sneha	Sanjaykumar	Patel	617	M. Pharm (QA)	0	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	FTE	EMPLOYEE	\N	\N
190	\N	Reena	Mafatlal	Thakkar	617	B. Pharm	4	30/6/2014	rajeshk@amnealindia.com	Quality control Chemical	Executive	EMPLOYEE	\N	\N
111	\N	Sachin	Ramesh	Ingale	619	M.Sc. Analytical chemistry	4	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Sr.Officer	EMPLOYEE	\N	\N
272	\N	Nisarg	Rajiv	Thakore	619	M.Sc. Organic chemistry	4.8	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Sr.Officer	EMPLOYEE	\N	\N
221	\N	Yogendra	Babubhai	Patel	617	M. Pharm	3.5	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Executive	EMPLOYEE	\N	\N
148	\N	Chandrakant	Jayantibhai	Patel	617	M.Sc.	7	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Executive	EMPLOYEE	\N	\N
235	\N	Bhavik	Kishorbhai	Chauhan	617	B.Pharm	1.6	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Officer	EMPLOYEE	\N	\N
255	\N	Dhaval	Dhirubhai	Mistry	617	M.Pharm	4	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Executive	EMPLOYEE	\N	\N
264	\N	Vishal	Govindbhai	Patel	617	B.Pharm	5	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Executive	EMPLOYEE	\N	\N
71	\N	Shantaram	L.	Nagpure	616	Ph.D.	22	30/6/2014	snagpure@amnealindia.com	Quality control Chemical	GM	EMPLOYEE	\N	\N
213	\N	Hemant	Jagdishchandra	Bhesota	619	B.Sc.	6	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Sr.Officer	EMPLOYEE	\N	\N
67	\N	Ashok	Karshanbhai	Adroja	619	M.Sc.	16	30/6/2014	Ashoka@amnealindia.com	Quality control Chemical	Asst. Manager	\N	\N	\N
\.


--
-- Name: tab_desig_maping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tab_desig_maping_id_seq', 1, false);


--
-- Name: tab_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tab_id_seq', 30, true);


--
-- Name: test_doc_seq_id; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('test_doc_seq_id', 1, false);


--
-- Name: tni_category_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tni_category_id_seq', 1, false);


--
-- Name: tni_category_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tni_category_mapping_id_seq', 1, false);


--
-- Name: tni_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tni_id_seq', 1, false);


--
-- Name: tni_image_master_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tni_image_master_id_seq', 1, false);


--
-- Name: tni_question_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tni_question_id_seq', 1, false);


--
-- Name: tni_question_option_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tni_question_option_id_seq', 1, false);


--
-- Name: tni_site_department_designation_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tni_site_department_designation_mapping_id_seq', 1, false);


--
-- Name: tni_sub_catagory_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tni_sub_catagory_id_seq', 1, false);


--
-- Name: tni_sub_category_emp_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tni_sub_category_emp_mapping_id_seq', 1, false);


--
-- Name: tni_test_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tni_test_id_seq', 1, false);


--
-- Name: tni_trainer_subcategory_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tni_trainer_subcategory_mapping_id_seq', 1, false);


--
-- Name: tni_trainig_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('tni_trainig_id_seq', 1, false);


--
-- Name: trainer_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('trainer_id_seq', 1, false);


--
-- Name: wfcm_adhoc_training_document__wfcm_adhoc_training_document__seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_adhoc_training_document__wfcm_adhoc_training_document__seq', 1, false);


--
-- Data for Name: wfcm_adhoc_training_document_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_adhoc_training_document_master (wfcm_adhoc_training_document_id, training_topic_id, counter, uploaded_question_doc_id, uploaded_doc_id) FROM stdin;
\.


--
-- Name: wfcm_adhoc_training_employee__wfcm_adhoc_training_employee__seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_adhoc_training_employee__wfcm_adhoc_training_employee__seq', 1, false);


--
-- Data for Name: wfcm_adhoc_training_employee_result_details; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_adhoc_training_employee_result_details (wfcm_adhoc_training_employee_id, adhoc_training_id, emp_id, result, percentage) FROM stdin;
\.


--
-- Data for Name: wfcm_adhoc_training_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_adhoc_training_master (adhoc_training_id, training_topic_id, trainer_idc, training_date, start_time, end_time, emp_id, is_internal, doc_id, site_id) FROM stdin;
\.


--
-- Name: wfcm_adhoc_training_master_adhoc_training_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_adhoc_training_master_adhoc_training_id_seq', 1, false);


--
-- Data for Name: wfcm_adhoc_training_topic_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_adhoc_training_topic_master (training_topic_id, training_topic, internal, has_question, site_id) FROM stdin;
\.


--
-- Name: wfcm_adhoc_training_topic_master_training_topic_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_adhoc_training_topic_master_training_topic_id_seq', 1, false);


--
-- Data for Name: wfcm_deviation_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_deviation_master (deviation_id, deviation_number, is_closed, emp_id, sop_training_id, training_start_date, training_end_date, deviation_date, deviation_created_by, deviation_comment, is_retrng) FROM stdin;
\.


--
-- Data for Name: wfcm_emp_sop_training_maping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_emp_sop_training_maping (emp_sop_training_maping_id, emp_id, sop_training_id) FROM stdin;
\.


--
-- Data for Name: wfcm_emp_tni_trainer_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_emp_tni_trainer_mapping (emp_tni_trainer_mapping_id, emp_id, trainer_id, tni_sub_category_id) FROM stdin;
\.


--
-- Data for Name: wfcm_emp_training_attendance; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_emp_training_attendance (emp_training_attendance_id, emp_id, sop_training_id, training_date, training_attended) FROM stdin;
\.


--
-- Data for Name: wfcm_employe_jd_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_employe_jd_mapping (emp_jd_id, jobdescription_id, emp_id, site_id) FROM stdin;
\.


--
-- Name: wfcm_employe_jd_mapping_emp_jd_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_employe_jd_mapping_emp_jd_id_seq', 9, true);


--
-- Data for Name: wfcm_employee_jobdescription; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_employee_jobdescription (jobdescription_id, emp_id, jd_desig_id, reporting_manager_emp_id, dept_training_coordinator_emp_id, updated_date, job_description_status, jd_created_by, revision_no, delegation_emp_id, absent_emp_id, doc_id, jd_uploaded, jd_dept_id, site_id, jd_approved_by) FROM stdin;
\.


--
-- Name: wfcm_employee_jobdescription_jobdescription_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_employee_jobdescription_jobdescription_id_seq', 10, true);


--
-- Data for Name: wfcm_employee_sop_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_employee_sop_mapping (employee_sop_mapping_id, emp_id, sop_id, version, isfixed) FROM stdin;
\.


--
-- Data for Name: wfcm_employee_tni_training_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_employee_tni_training_mapping (employee_tni_training_mapping_id, emp_id, tni_trainig_id) FROM stdin;
\.


--
-- Data for Name: wfcm_employee_training_certificate; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_employee_training_certificate (employee_training_certificate_id, emp_id, issue_date, hod_emp_id, certificate, comment, date_of_last_jr) FROM stdin;
\.


--
-- Data for Name: wfcm_function_department_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_function_department_mapping (function_department_mapping_id, function_id, department_id) FROM stdin;
\.


--
-- Name: wfcm_function_department_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_function_department_mapping_id_seq', 8, true);


--
-- Data for Name: wfcm_function_emp_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_function_emp_mapping (function_emp_mapping_id, function_id, emp_id, version, function_justification_id, site_id) FROM stdin;
\.


--
-- Name: wfcm_function_emp_mapping_function_emp_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_function_emp_mapping_function_emp_mapping_id_seq', 1, false);


--
-- Name: wfcm_function_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_function_id_seq', 8, true);


--
-- Data for Name: wfcm_function_justification; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_function_justification (function_justification_id, justification) FROM stdin;
\.


--
-- Name: wfcm_function_justification_function_justification_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_function_justification_function_justification_id_seq', 1, false);


--
-- Data for Name: wfcm_function_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_function_master (function_id, function_name, function_code, function_description, is_active, pending_approval, approval_flag, approval_time, approval_user_id, approval_comments, deactivated_by, deactivated_date, deactivation_comment, task_id, site_id) FROM stdin;
\.


--
-- Data for Name: wfcm_function_sop_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_function_sop_mapping (function_sop_mapping_id, function_id, sop_id, is_active, deactivated_by, deactivated_date, deactivation_comment) FROM stdin;
\.


--
-- Name: wfcm_function_sop_mapping_function_sop_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_function_sop_mapping_function_sop_mapping_id_seq', 9, true);


--
-- Data for Name: wfcm_hr_department_trainer_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_hr_department_trainer_mapping (hr_department_trainer_mapping_id, trainer_id, training_topic, site_id, dept_name) FROM stdin;
\.


--
-- Data for Name: wfcm_hr_dept_training; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_hr_dept_training (id, emp_id, dept_id, site_id, start_time, end_time, approval_status, approved_by, approval_time, created_date, doc_id, task_id) FROM stdin;
\.


--
-- Data for Name: wfcm_hr_training; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_hr_training (hr_training_id, emp_id, training_date, training_id, created_date, status) FROM stdin;
\.


--
-- Data for Name: wfcm_job_responsiblities; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_job_responsiblities (respo_id, jobdescription_id, responsiblities) FROM stdin;
\.


--
-- Name: wfcm_job_responsiblities_respo_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_job_responsiblities_respo_id_seq', 4, true);


--
-- Data for Name: wfcm_live_sop_test; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_live_sop_test (live_sop_test_id, emp_id, sop_training_id, sop_version_id, test_create_date, training_start_date, training_end_date, is_retrng, is_deviated, last_score, test_data, attempt, mail_scheduled, task_id, in_progress) FROM stdin;
\.


--
-- Data for Name: wfcm_live_tni_test; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_live_tni_test (live_tni_test_id, emp_id, tni_trainig_id, tni_sub_category_id, tni_id, test_create_date, training_start_date, training_end_date, is_retrng, attempt, max_score, is_pass_fail, last_score, test_data) FROM stdin;
\.


--
-- Name: wfcm_live_tni_test_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_live_tni_test_id_seq', 1, false);


--
-- Data for Name: wfcm_room_training; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_room_training (wfcm_room_training_id, uploaded_date, doc_id) FROM stdin;
\.


--
-- Name: wfcm_room_training_id; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_room_training_id', 1, false);


--
-- Data for Name: wfcm_room_training_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_room_training_mapping (wfcm_room_training_mapping_id, wfcm_room_training_id, emp_id, wfcm_sop_test_id, sop_version_id, test_date, start_time, end_time, has_question, emp_doc_id) FROM stdin;
\.


--
-- Name: wfcm_room_training_mapping_wfcm_room_training_mapping_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_room_training_mapping_wfcm_room_training_mapping_id_seq', 1, false);


--
-- Data for Name: wfcm_sop_approval; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_approval (sop_approval_id, sop_id, message, from_site_dept, to_site_dept, request_date, response_date, status) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_blocked_test; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_blocked_test (sop_blocked_test_id, emp_id, sop_training_id, attmpt, approval, applied, comment, task_id, unblocked_by, site_id) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_category_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_category_mapping (sop_category_mapping_id, sop_category_id, sop_version_id) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_category_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_category_master (sop_category_id, sop_category_name, isactive, site_id) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_department_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_department_mapping (sop_department_mapping_id, dept_id, sop_version_id) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_image_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_image_master (sop_image_master_id, upload_date, sop_uploaded, sop_version_id) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_master (sop_id, description, ref_doc_no, additional_links, is_active, last_revision_number, issop, created_date, counter, deactivated_by, deactivated_date, deactivation_comment, site_id) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_media; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_media (sop_media_id, sop_version_id, filname, is_active, sop_media_data, type, created_date, updated_date, creted_by) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_question_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_question_master (sop_question_id, question_text, is_compuslory, sop_version_id) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_question_option_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_question_option_mapping (sop_question_option_id, sop_question_id, option_text, is_true) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_site_department_group_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_site_department_group_mapping (sop_site_department_group_mapping_id, sop_version_id, site_id, dept_id, is_active, is_harmonized, group_id) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_status_handler; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_status_handler (sop_approval_id, sop_version_id, approved_by, approves_date, comment, approve_status, disapprove_status, task_id) FROM stdin;
\.


--
-- Name: wfcm_sop_status_handler_sop_approval_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_sop_status_handler_sop_approval_id_seq', 1, false);


--
-- Data for Name: wfcm_sop_test; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_test (sop_test_id, emp_id, sop_training_id, sop_version_id, attempt, score, test_date, is_retrng, is_pass_fail, max_score, trainer_id) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_test_data; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_test_data (sop_test_data_id, sop_question_id, user_answer) FROM stdin;
\.


--
-- Data for Name: wfcm_sop_training_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_training_master (sop_training_id, sop_version_id, training_type, training_internal_external, trainer_info, training_assesment, training_topic, training_start_date, training_end_date, start_time, end_time, training_create_date, isgeneric, comment, created_after_effective_date, created_by, pass_score, mail_scheduled) FROM stdin;
\.


--
-- Name: wfcm_sop_training_master_sop_training_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_sop_training_master_sop_training_id_seq', 1, false);


--
-- Data for Name: wfcm_sop_version; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_sop_version (sop_version_id, revision_no, effective_date, next_review_date, valid_till, sop_name, has_question, has_refreshment_period, refreshment_period, sopReadTime, change_controll_no, doc_id, sop_id, created_date, created_by, job_responsibility, is_image, is_active, status, sop_status, approvedby, approveddate, counter, deactivated_by, deactivated_date, deactivation_comment, task_id, glp_relevant, reason_for_change) FROM stdin;
\.


--
-- Data for Name: wfcm_test_doc_mstr; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_test_doc_mstr (doc_id, doc_uploaded, uploaded_date, wfcm_sop_test_id, has_question) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_category_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_category_mapping (tni_category_mapping_id, tni_id, tni_sub_category_id, version) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_category_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_category_master (tni_category_id, tni_category_name, tni_isactive) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_image_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_image_master (tni_image_master_id, upload_date, tni_uploaded, tni_id) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_master (tni_id, description, is_read_and_ack, effective_date, valid_till, next_review_date, additional_links, is_active, doc_id, is_image_uploaded, version, sub_category, is_latest, tni_name) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_question_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_question_master (tni_question_id, tni_id, question_text, is_compuslory) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_question_option_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_question_option_mapping (tni_question_option_id, tni_question_id, tni_question_option_text, is_true) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_site_department_designation_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_site_department_designation_mapping (tni_site_department_designation_mapping_id, tni_id, site_id, dept_id, desig_id, isactive) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_sub_catagory_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_sub_catagory_master (tni_sub_category_id, tni_sub_category_name, tni_category_id) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_sub_category_emp_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_sub_category_emp_mapping (tni_sub_category_emp_mapping_id, emp_id, tni_sub_category_id, assignment_no) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_test; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_test (tni_test_id, emp_id, tni_training_id, attempt, score, test_date, max_score, is_pass_fail) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_test_data; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_test_data (tni_test_id, tni_question_id, user_answer) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_trainer_subcategory_mapping; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_trainer_subcategory_mapping (tni_trainer_subcategory_mapping_id, tni_sub_catagory_id, emp_tni_trainer_mapping_id) FROM stdin;
\.


--
-- Data for Name: wfcm_tni_training_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_tni_training_master (tni_trainig_id, tni_id, training_type, training_internal_external, trainer_info, training_assesment, training_topic, training_start_dt, training_end_dt, start_time, end_time, training_create_dt, isgeneric, comment, created_after_eff_date, max_score) FROM stdin;
\.


--
-- Data for Name: wfcm_trainer_certificate; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_trainer_certificate (wfcm_trainer_certificate_id, emp_id, certificate_doc_id) FROM stdin;
\.


--
-- Name: wfcm_trainer_certificate_wfcm_trainer_certificate_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_trainer_certificate_wfcm_trainer_certificate_id_seq', 1, false);


--
-- Data for Name: wfcm_trainer_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_trainer_master (trainer_id, trainer_idc, salutation, trainer_name, trainer_middle_name, trainer_surname, trainer_phone, trainer_email_id, organization, trainer_designation, trainer_experiance, created_date, is_active) FROM stdin;
\.


--
-- Name: wfcm_training_deviation_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_training_deviation_seq', 1, false);


--
-- Data for Name: wfcm_upload_induction_master; Type: TABLE DATA; Schema: camsdb; Owner: cams
--

COPY wfcm_upload_induction_master (uploaded_induction_id, test_date, doc_id, site_id) FROM stdin;
\.


--
-- Name: wfcm_upload_induction_master_uploaded_induction_id_seq; Type: SEQUENCE SET; Schema: camsdb; Owner: cams
--

SELECT pg_catalog.setval('wfcm_upload_induction_master_uploaded_induction_id_seq', 3, true);


--
-- Name: cams_adhoc_role_applicants_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_adhoc_role_applicants_mapping
    ADD CONSTRAINT cams_adhoc_role_applicants_mapping_pkey PRIMARY KEY (adhoc_role_applicant_id);


--
-- Name: cams_adhoc_role_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_adhoc_role_master
    ADD CONSTRAINT cams_adhoc_role_master_pkey PRIMARY KEY (adhoc_role_id);


--
-- Name: cams_adhoc_role_permission_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_adhoc_role_permission_mapping
    ADD CONSTRAINT cams_adhoc_role_permission_mapping_pkey PRIMARY KEY (id);


--
-- Name: cams_admin_config_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_admin_config
    ADD CONSTRAINT cams_admin_config_pkey PRIMARY KEY (admin_config_id);


--
-- Name: cams_audit_log_entity_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_audit_log_entity
    ADD CONSTRAINT cams_audit_log_entity_pkey PRIMARY KEY (audit_log_id);


--
-- Name: cams_client_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_client_master
    ADD CONSTRAINT cams_client_master_pkey PRIMARY KEY (client_id);


--
-- Name: cams_client_module_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_client_module_mapping
    ADD CONSTRAINT cams_client_module_mapping_pkey PRIMARY KEY (module_client_mapping_id);


--
-- Name: cams_department_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_department_master
    ADD CONSTRAINT cams_department_master_pkey PRIMARY KEY (dept_id);


--
-- Name: cams_designation_group_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_designation_group_mapping
    ADD CONSTRAINT cams_designation_group_mapping_pkey PRIMARY KEY (designation_group_maping_id);


--
-- Name: cams_designation_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_designation_master
    ADD CONSTRAINT cams_designation_master_pkey PRIMARY KEY (desig_id);


--
-- Name: cams_document_mstr_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_document_mstr
    ADD CONSTRAINT cams_document_mstr_pkey PRIMARY KEY (doc_id);


--
-- Name: cams_email_queue_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_email_queue
    ADD CONSTRAINT cams_email_queue_pkey PRIMARY KEY (id);


--
-- Name: cams_employe_hire_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_employe_hire_mapping
    ADD CONSTRAINT cams_employe_hire_mapping_pkey PRIMARY KEY (emp_hire_id);


--
-- Name: cams_employee_hire_status_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_employee_hire_status
    ADD CONSTRAINT cams_employee_hire_status_pkey PRIMARY KEY (tracking_id);


--
-- Name: cams_employee_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_employee_mapping
    ADD CONSTRAINT cams_employee_mapping_pkey PRIMARY KEY (emp_maping_id);


--
-- Name: cams_employee_mstr_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_employee_mstr
    ADD CONSTRAINT cams_employee_mstr_pkey PRIMARY KEY (emp_id);


--
-- Name: cams_employee_picture_mstr_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_employee_picture_mstr
    ADD CONSTRAINT cams_employee_picture_mstr_pkey PRIMARY KEY (emp_pic_id);


--
-- Name: cams_employee_role_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_employee_role_mapping
    ADD CONSTRAINT cams_employee_role_mapping_pkey PRIMARY KEY (role_id);


--
-- Name: cams_employee_trainer_certification_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_employee_trainer_certification
    ADD CONSTRAINT cams_employee_trainer_certification_pkey PRIMARY KEY (emp_trnr_certifcation_id);


--
-- Name: cams_group_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_group_master
    ADD CONSTRAINT cams_group_master_pkey PRIMARY KEY (group_id);


--
-- Name: cams_label_resources_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_label_resources
    ADD CONSTRAINT cams_label_resources_pkey PRIMARY KEY (resource_key, lang);


--
-- Name: cams_login_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_login_master
    ADD CONSTRAINT cams_login_master_pkey PRIMARY KEY (id);


--
-- Name: cams_mail_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_mail
    ADD CONSTRAINT cams_mail_pkey PRIMARY KEY (mail_id);


--
-- Name: cams_mail_site_scheduler_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_mail_site_scheduler
    ADD CONSTRAINT cams_mail_site_scheduler_pkey PRIMARY KEY (mail_site_scheduler_id);


--
-- Name: cams_module_emp_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_module_emp_mapping
    ADD CONSTRAINT cams_module_emp_mapping_pkey PRIMARY KEY (module_emp_mapping_id);


--
-- Name: cams_module_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_module_master
    ADD CONSTRAINT cams_module_master_pkey PRIMARY KEY (module_id);


--
-- Name: cams_module_resource_designation_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_module_resource_designation_mapping
    ADD CONSTRAINT cams_module_resource_designation_mapping_pkey PRIMARY KEY (module_resource_designation_mapping_id);


--
-- Name: cams_module_resource_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_module_resource_mapping
    ADD CONSTRAINT cams_module_resource_mapping_pkey PRIMARY KEY (module_resource_mapping_id);


--
-- Name: cams_module_tab_adhocrole_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_module_tab_adhocrole_mapping
    ADD CONSTRAINT cams_module_tab_adhocrole_mapping_pkey PRIMARY KEY (cams_module_tab_adhocrole_mapping_id);


--
-- Name: cams_module_tab_designation_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_module_tab_designation_mapping
    ADD CONSTRAINT cams_module_tab_designation_mapping_pkey PRIMARY KEY (module_tab_designation_mapping_id);


--
-- Name: cams_module_tab_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_module_tab_mapping
    ADD CONSTRAINT cams_module_tab_mapping_pkey PRIMARY KEY (module_tab_mapping_id);


--
-- Name: cams_permission_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_permission_master
    ADD CONSTRAINT cams_permission_master_pkey PRIMARY KEY (id);


--
-- Name: cams_pwd_answer_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_pwd_answer
    ADD CONSTRAINT cams_pwd_answer_pkey PRIMARY KEY (emp_id, pwd_question_id);


--
-- Name: cams_pwd_question_mstr_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_pwd_question_mstr
    ADD CONSTRAINT cams_pwd_question_mstr_pkey PRIMARY KEY (pwd_question_id);


--
-- Name: cams_resource_emp_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_resource_emp_mapping
    ADD CONSTRAINT cams_resource_emp_mapping_pkey PRIMARY KEY (resource_emp_mapping_id);


--
-- Name: cams_resource_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_resource_master
    ADD CONSTRAINT cams_resource_master_pkey PRIMARY KEY (resource_id);


--
-- Name: cams_site_deparment_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_site_deparment_mapping
    ADD CONSTRAINT cams_site_deparment_mapping_pkey PRIMARY KEY (site_dept_mpng_id);


--
-- Name: cams_site_department_designation_group_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_site_department_designation_group_mapping
    ADD CONSTRAINT cams_site_department_designation_group_mapping_pkey PRIMARY KEY (site_dept_desig_group_id);


--
-- Name: cams_site_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_site_master
    ADD CONSTRAINT cams_site_master_pkey PRIMARY KEY (site_id);


--
-- Name: cams_tab_designation_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_tab_designation_mapping
    ADD CONSTRAINT cams_tab_designation_mapping_pkey PRIMARY KEY (tab_desig_maping_id);


--
-- Name: cams_tab_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_tab_master
    ADD CONSTRAINT cams_tab_master_pkey PRIMARY KEY (tab_id);


--
-- Name: cams_translation_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_translation
    ADD CONSTRAINT cams_translation_pkey PRIMARY KEY (id);


--
-- Name: cams_user_task_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_user_task
    ADD CONSTRAINT cams_user_task_pkey PRIMARY KEY (id);


--
-- Name: deviation_mstr_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_deviation_master
    ADD CONSTRAINT deviation_mstr_pkey PRIMARY KEY (deviation_id);


--
-- Name: hr_training_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_hr_training
    ADD CONSTRAINT hr_training_pkey PRIMARY KEY (hr_training_id);


--
-- Name: live_test_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_live_sop_test
    ADD CONSTRAINT live_test_pkey PRIMARY KEY (live_sop_test_id);


--
-- Name: live_tni_test_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_live_tni_test
    ADD CONSTRAINT live_tni_test_pkey PRIMARY KEY (live_tni_test_id);


--
-- Name: media_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_media
    ADD CONSTRAINT media_pkey PRIMARY KEY (sop_media_id);


--
-- Name: pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_hr_dept_training
    ADD CONSTRAINT pkey PRIMARY KEY (id);


--
-- Name: test_doc_mstr_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_test_doc_mstr
    ADD CONSTRAINT test_doc_mstr_pkey PRIMARY KEY (doc_id);


--
-- Name: tni_image_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_image_master
    ADD CONSTRAINT tni_image_master_pkey PRIMARY KEY (tni_image_master_id);


--
-- Name: wfcm_adhoc_training_document_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_adhoc_training_document_master
    ADD CONSTRAINT wfcm_adhoc_training_document_master_pkey PRIMARY KEY (wfcm_adhoc_training_document_id);


--
-- Name: wfcm_adhoc_training_employee_result_details_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_adhoc_training_employee_result_details
    ADD CONSTRAINT wfcm_adhoc_training_employee_result_details_pkey PRIMARY KEY (wfcm_adhoc_training_employee_id);


--
-- Name: wfcm_adhoc_training_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_adhoc_training_master
    ADD CONSTRAINT wfcm_adhoc_training_master_pkey PRIMARY KEY (adhoc_training_id);


--
-- Name: wfcm_adhoc_training_topic_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_adhoc_training_topic_master
    ADD CONSTRAINT wfcm_adhoc_training_topic_master_pkey PRIMARY KEY (training_topic_id);


--
-- Name: wfcm_emp_sop_training_maping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_emp_sop_training_maping
    ADD CONSTRAINT wfcm_emp_sop_training_maping_pkey PRIMARY KEY (emp_sop_training_maping_id);


--
-- Name: wfcm_emp_tni_trainer_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_emp_tni_trainer_mapping
    ADD CONSTRAINT wfcm_emp_tni_trainer_mapping_pkey PRIMARY KEY (emp_tni_trainer_mapping_id);


--
-- Name: wfcm_emp_training_attendance_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_emp_training_attendance
    ADD CONSTRAINT wfcm_emp_training_attendance_pkey PRIMARY KEY (emp_training_attendance_id);


--
-- Name: wfcm_employe_jd_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_employe_jd_mapping
    ADD CONSTRAINT wfcm_employe_jd_mapping_pkey PRIMARY KEY (emp_jd_id);


--
-- Name: wfcm_employee_jobdescription_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_employee_jobdescription
    ADD CONSTRAINT wfcm_employee_jobdescription_pkey PRIMARY KEY (jobdescription_id);


--
-- Name: wfcm_employee_sop_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_employee_sop_mapping
    ADD CONSTRAINT wfcm_employee_sop_mapping_pkey PRIMARY KEY (employee_sop_mapping_id);


--
-- Name: wfcm_employee_tni_training_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_employee_tni_training_mapping
    ADD CONSTRAINT wfcm_employee_tni_training_mapping_pkey PRIMARY KEY (employee_tni_training_mapping_id);


--
-- Name: wfcm_employee_training_certificate_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_employee_training_certificate
    ADD CONSTRAINT wfcm_employee_training_certificate_pkey PRIMARY KEY (employee_training_certificate_id);


--
-- Name: wfcm_function_department_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_function_department_mapping
    ADD CONSTRAINT wfcm_function_department_mapping_pkey PRIMARY KEY (function_department_mapping_id);


--
-- Name: wfcm_function_emp_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_function_emp_mapping
    ADD CONSTRAINT wfcm_function_emp_mapping_pkey PRIMARY KEY (function_emp_mapping_id);


--
-- Name: wfcm_function_justification_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_function_justification
    ADD CONSTRAINT wfcm_function_justification_pkey PRIMARY KEY (function_justification_id);


--
-- Name: wfcm_function_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_function_master
    ADD CONSTRAINT wfcm_function_master_pkey PRIMARY KEY (function_id);


--
-- Name: wfcm_function_sop_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_function_sop_mapping
    ADD CONSTRAINT wfcm_function_sop_mapping_pkey PRIMARY KEY (function_sop_mapping_id);


--
-- Name: wfcm_hr_department_trainer_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_hr_department_trainer_mapping
    ADD CONSTRAINT wfcm_hr_department_trainer_mapping_pkey PRIMARY KEY (hr_department_trainer_mapping_id);


--
-- Name: wfcm_job_responsiblities_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_job_responsiblities
    ADD CONSTRAINT wfcm_job_responsiblities_pkey PRIMARY KEY (respo_id);


--
-- Name: wfcm_pending_mail_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY cams_pending_mail
    ADD CONSTRAINT wfcm_pending_mail_pkey PRIMARY KEY (mail_id);


--
-- Name: wfcm_room_training1; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_room_training
    ADD CONSTRAINT wfcm_room_training1 PRIMARY KEY (wfcm_room_training_id);


--
-- Name: wfcm_room_training_mapping1; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_room_training_mapping
    ADD CONSTRAINT wfcm_room_training_mapping1 PRIMARY KEY (wfcm_room_training_mapping_id);


--
-- Name: wfcm_sop_approval_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_approval
    ADD CONSTRAINT wfcm_sop_approval_pkey PRIMARY KEY (sop_approval_id);


--
-- Name: wfcm_sop_blocked_test_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_blocked_test
    ADD CONSTRAINT wfcm_sop_blocked_test_pkey PRIMARY KEY (sop_blocked_test_id);


--
-- Name: wfcm_sop_category_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_category_mapping
    ADD CONSTRAINT wfcm_sop_category_mapping_pkey PRIMARY KEY (sop_category_mapping_id);


--
-- Name: wfcm_sop_category_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_category_master
    ADD CONSTRAINT wfcm_sop_category_master_pkey PRIMARY KEY (sop_category_id);


--
-- Name: wfcm_sop_department_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_department_mapping
    ADD CONSTRAINT wfcm_sop_department_mapping_pkey PRIMARY KEY (sop_department_mapping_id);


--
-- Name: wfcm_sop_image_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_image_master
    ADD CONSTRAINT wfcm_sop_image_master_pkey PRIMARY KEY (sop_image_master_id);


--
-- Name: wfcm_sop_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_master
    ADD CONSTRAINT wfcm_sop_master_pkey PRIMARY KEY (sop_id);


--
-- Name: wfcm_sop_question_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_question_master
    ADD CONSTRAINT wfcm_sop_question_master_pkey PRIMARY KEY (sop_question_id);


--
-- Name: wfcm_sop_question_option_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_question_option_mapping
    ADD CONSTRAINT wfcm_sop_question_option_mapping_pkey PRIMARY KEY (sop_question_option_id);


--
-- Name: wfcm_sop_site_department_group_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_site_department_group_mapping
    ADD CONSTRAINT wfcm_sop_site_department_group_mapping_pkey PRIMARY KEY (sop_site_department_group_mapping_id);


--
-- Name: wfcm_sop_status_handler_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_status_handler
    ADD CONSTRAINT wfcm_sop_status_handler_pkey PRIMARY KEY (sop_approval_id);


--
-- Name: wfcm_sop_test_data_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_test_data
    ADD CONSTRAINT wfcm_sop_test_data_pkey PRIMARY KEY (sop_test_data_id, sop_question_id);


--
-- Name: wfcm_sop_test_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_test
    ADD CONSTRAINT wfcm_sop_test_pkey PRIMARY KEY (sop_test_id);


--
-- Name: wfcm_sop_training_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_training_master
    ADD CONSTRAINT wfcm_sop_training_master_pkey PRIMARY KEY (sop_training_id);


--
-- Name: wfcm_sop_version_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_sop_version
    ADD CONSTRAINT wfcm_sop_version_pkey PRIMARY KEY (sop_version_id);


--
-- Name: wfcm_tni_category_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_category_mapping
    ADD CONSTRAINT wfcm_tni_category_mapping_pkey PRIMARY KEY (tni_category_mapping_id);


--
-- Name: wfcm_tni_category_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_category_master
    ADD CONSTRAINT wfcm_tni_category_master_pkey PRIMARY KEY (tni_category_id);


--
-- Name: wfcm_tni_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_master
    ADD CONSTRAINT wfcm_tni_master_pkey PRIMARY KEY (tni_id);


--
-- Name: wfcm_tni_question_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_question_master
    ADD CONSTRAINT wfcm_tni_question_master_pkey PRIMARY KEY (tni_question_id);


--
-- Name: wfcm_tni_question_option_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_question_option_mapping
    ADD CONSTRAINT wfcm_tni_question_option_mapping_pkey PRIMARY KEY (tni_question_option_id);


--
-- Name: wfcm_tni_site_department_designation_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_site_department_designation_mapping
    ADD CONSTRAINT wfcm_tni_site_department_designation_mapping_pkey PRIMARY KEY (tni_site_department_designation_mapping_id);


--
-- Name: wfcm_tni_sub_catagory_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_sub_catagory_master
    ADD CONSTRAINT wfcm_tni_sub_catagory_master_pkey PRIMARY KEY (tni_sub_category_id);


--
-- Name: wfcm_tni_sub_category_emp_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_sub_category_emp_mapping
    ADD CONSTRAINT wfcm_tni_sub_category_emp_mapping_pkey PRIMARY KEY (tni_sub_category_emp_mapping_id);


--
-- Name: wfcm_tni_test_data_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_test_data
    ADD CONSTRAINT wfcm_tni_test_data_pkey PRIMARY KEY (tni_test_id, tni_question_id);


--
-- Name: wfcm_tni_test_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_test
    ADD CONSTRAINT wfcm_tni_test_pkey PRIMARY KEY (tni_test_id);


--
-- Name: wfcm_tni_trainer_subcategory_mapping_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_trainer_subcategory_mapping
    ADD CONSTRAINT wfcm_tni_trainer_subcategory_mapping_pkey PRIMARY KEY (tni_trainer_subcategory_mapping_id);


--
-- Name: wfcm_tni_training_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_tni_training_master
    ADD CONSTRAINT wfcm_tni_training_master_pkey PRIMARY KEY (tni_trainig_id);


--
-- Name: wfcm_trainer_certificate_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_trainer_certificate
    ADD CONSTRAINT wfcm_trainer_certificate_pkey PRIMARY KEY (wfcm_trainer_certificate_id);


--
-- Name: wfcm_trainer_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_trainer_master
    ADD CONSTRAINT wfcm_trainer_master_pkey PRIMARY KEY (trainer_id);


--
-- Name: wfcm_upload_induction_master_pkey; Type: CONSTRAINT; Schema: camsdb; Owner: cams; Tablespace: 
--

ALTER TABLE ONLY wfcm_upload_induction_master
    ADD CONSTRAINT wfcm_upload_induction_master_pkey PRIMARY KEY (uploaded_induction_id);


--
-- Name: unique_emp_id_company; Type: INDEX; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE UNIQUE INDEX unique_emp_id_company ON cams_employee_mstr USING btree (emp_id_company);


--
-- Name: unique_function_code; Type: INDEX; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE UNIQUE INDEX unique_function_code ON wfcm_function_master USING btree (function_code, site_id);


--
-- Name: unique_group_name; Type: INDEX; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE UNIQUE INDEX unique_group_name ON cams_group_master USING btree (group_name);


--
-- Name: unique_site_name; Type: INDEX; Schema: camsdb; Owner: cams; Tablespace: 
--

CREATE UNIQUE INDEX unique_site_name ON cams_site_master USING btree (site_name);


--
-- Name: cams_adhoc_role_applicants_mapping_adhoc_role_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_adhoc_role_applicants_mapping
    ADD CONSTRAINT cams_adhoc_role_applicants_mapping_adhoc_role_id_fkey FOREIGN KEY (adhoc_role_id) REFERENCES cams_adhoc_role_master(adhoc_role_id);


--
-- Name: cams_adhoc_role_applicants_mapping_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_adhoc_role_applicants_mapping
    ADD CONSTRAINT cams_adhoc_role_applicants_mapping_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: cams_adhoc_role_permission_mapping_adhoc_role_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_adhoc_role_permission_mapping
    ADD CONSTRAINT cams_adhoc_role_permission_mapping_adhoc_role_id_fkey FOREIGN KEY (adhoc_role_id) REFERENCES cams_adhoc_role_master(adhoc_role_id);


--
-- Name: cams_adhoc_role_permission_mapping_permission_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_adhoc_role_permission_mapping
    ADD CONSTRAINT cams_adhoc_role_permission_mapping_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES cams_permission_master(id);


--
-- Name: cams_client_module_mapping_client_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_client_module_mapping
    ADD CONSTRAINT cams_client_module_mapping_client_id_fkey FOREIGN KEY (client_id) REFERENCES cams_client_master(client_id);


--
-- Name: cams_client_module_mapping_module_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_client_module_mapping
    ADD CONSTRAINT cams_client_module_mapping_module_id_fkey FOREIGN KEY (module_id) REFERENCES cams_module_master(module_id);


--
-- Name: cams_department_master_parent_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_department_master
    ADD CONSTRAINT cams_department_master_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES cams_department_master(dept_id);


--
-- Name: cams_designation_group_mapping_desig_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_designation_group_mapping
    ADD CONSTRAINT cams_designation_group_mapping_desig_id_fkey FOREIGN KEY (desig_id) REFERENCES cams_designation_master(desig_id);


--
-- Name: cams_designation_group_mapping_group_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_designation_group_mapping
    ADD CONSTRAINT cams_designation_group_mapping_group_id_fkey FOREIGN KEY (group_id) REFERENCES cams_group_master(group_id);


--
-- Name: cams_document_mstr_uploaded_by_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_document_mstr
    ADD CONSTRAINT cams_document_mstr_uploaded_by_fkey FOREIGN KEY (uploaded_by) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: cams_employe_hire_mapping_tracking_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_employe_hire_mapping
    ADD CONSTRAINT cams_employe_hire_mapping_tracking_id_fkey FOREIGN KEY (tracking_id) REFERENCES cams_employee_hire_status(tracking_id);


--
-- Name: cams_employee_hire_status_task_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_employee_hire_status
    ADD CONSTRAINT cams_employee_hire_status_task_id_fkey FOREIGN KEY (task_id) REFERENCES cams_user_task(id);


--
-- Name: cams_employee_hire_status_task_id_fkey1; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_employee_hire_status
    ADD CONSTRAINT cams_employee_hire_status_task_id_fkey1 FOREIGN KEY (task_id) REFERENCES cams_user_task(id);


--
-- Name: cams_employee_mapping_dept_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_employee_mapping
    ADD CONSTRAINT cams_employee_mapping_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES cams_department_master(dept_id);


--
-- Name: cams_employee_mapping_desig_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_employee_mapping
    ADD CONSTRAINT cams_employee_mapping_desig_id_fkey FOREIGN KEY (desig_id) REFERENCES cams_designation_master(desig_id);


--
-- Name: cams_employee_mapping_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_employee_mapping
    ADD CONSTRAINT cams_employee_mapping_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: cams_employee_mapping_site_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_employee_mapping
    ADD CONSTRAINT cams_employee_mapping_site_id_fkey FOREIGN KEY (site_id) REFERENCES cams_site_master(site_id);


--
-- Name: cams_employee_mstr_reporting_manager_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_employee_mstr
    ADD CONSTRAINT cams_employee_mstr_reporting_manager_fkey FOREIGN KEY (reporting_manager) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: cams_employee_mstr_training_manager_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_employee_mstr
    ADD CONSTRAINT cams_employee_mstr_training_manager_fkey FOREIGN KEY (training_manager) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: cams_employee_picture_mstr_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_employee_picture_mstr
    ADD CONSTRAINT cams_employee_picture_mstr_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: cams_mail_recipient_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_mail
    ADD CONSTRAINT cams_mail_recipient_fkey FOREIGN KEY (recipient) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: cams_mail_sender_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_mail
    ADD CONSTRAINT cams_mail_sender_fkey FOREIGN KEY (sender) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: cams_mail_site_scheduler_site_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_mail_site_scheduler
    ADD CONSTRAINT cams_mail_site_scheduler_site_id_fkey FOREIGN KEY (site_id) REFERENCES cams_site_master(site_id);


--
-- Name: cams_module_emp_mapping_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_emp_mapping
    ADD CONSTRAINT cams_module_emp_mapping_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: cams_module_emp_mapping_module_client_mapping_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_emp_mapping
    ADD CONSTRAINT cams_module_emp_mapping_module_client_mapping_id_fkey FOREIGN KEY (module_client_mapping_id) REFERENCES cams_client_module_mapping(module_client_mapping_id);


--
-- Name: cams_module_resource_designation_mapping_designation_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_resource_designation_mapping
    ADD CONSTRAINT cams_module_resource_designation_mapping_designation_id_fkey FOREIGN KEY (designation_id) REFERENCES cams_designation_master(desig_id);


--
-- Name: cams_module_resource_designation_mapping_module_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_resource_designation_mapping
    ADD CONSTRAINT cams_module_resource_designation_mapping_module_id_fkey FOREIGN KEY (module_id) REFERENCES cams_client_module_mapping(module_client_mapping_id);


--
-- Name: cams_module_resource_designation_mapping_resource_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_resource_designation_mapping
    ADD CONSTRAINT cams_module_resource_designation_mapping_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES cams_resource_master(resource_id);


--
-- Name: cams_module_resource_mapping_module_client_mapping_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_resource_mapping
    ADD CONSTRAINT cams_module_resource_mapping_module_client_mapping_id_fkey FOREIGN KEY (module_client_mapping_id) REFERENCES cams_client_module_mapping(module_client_mapping_id);


--
-- Name: cams_module_resource_mapping_resource_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_resource_mapping
    ADD CONSTRAINT cams_module_resource_mapping_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES cams_resource_master(resource_id);


--
-- Name: cams_module_tab_adhocrole_mapping_adhoc_role_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_tab_adhocrole_mapping
    ADD CONSTRAINT cams_module_tab_adhocrole_mapping_adhoc_role_id_fkey FOREIGN KEY (adhoc_role_id) REFERENCES cams_adhoc_role_master(adhoc_role_id);


--
-- Name: cams_module_tab_adhocrole_mapping_module_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_tab_adhocrole_mapping
    ADD CONSTRAINT cams_module_tab_adhocrole_mapping_module_id_fkey FOREIGN KEY (module_id) REFERENCES cams_client_module_mapping(module_client_mapping_id);


--
-- Name: cams_module_tab_adhocrole_mapping_tab_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_tab_adhocrole_mapping
    ADD CONSTRAINT cams_module_tab_adhocrole_mapping_tab_id_fkey FOREIGN KEY (tab_id) REFERENCES cams_tab_master(tab_id);


--
-- Name: cams_module_tab_designation_mapping_designation_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_tab_designation_mapping
    ADD CONSTRAINT cams_module_tab_designation_mapping_designation_id_fkey FOREIGN KEY (designation_id) REFERENCES cams_designation_master(desig_id);


--
-- Name: cams_module_tab_designation_mapping_module_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_tab_designation_mapping
    ADD CONSTRAINT cams_module_tab_designation_mapping_module_id_fkey FOREIGN KEY (module_id) REFERENCES cams_client_module_mapping(module_client_mapping_id);


--
-- Name: cams_module_tab_designation_mapping_tab_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_tab_designation_mapping
    ADD CONSTRAINT cams_module_tab_designation_mapping_tab_id_fkey FOREIGN KEY (tab_id) REFERENCES cams_tab_master(tab_id);


--
-- Name: cams_module_tab_mapping_module_client_mapping_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_tab_mapping
    ADD CONSTRAINT cams_module_tab_mapping_module_client_mapping_id_fkey FOREIGN KEY (module_client_mapping_id) REFERENCES cams_client_module_mapping(module_client_mapping_id);


--
-- Name: cams_module_tab_mapping_tab_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_module_tab_mapping
    ADD CONSTRAINT cams_module_tab_mapping_tab_id_fkey FOREIGN KEY (tab_id) REFERENCES cams_tab_master(tab_id);


--
-- Name: cams_pwd_answer_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_pwd_answer
    ADD CONSTRAINT cams_pwd_answer_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: cams_pwd_answer_pwd_question_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_pwd_answer
    ADD CONSTRAINT cams_pwd_answer_pwd_question_id_fkey FOREIGN KEY (pwd_question_id) REFERENCES cams_pwd_question_mstr(pwd_question_id);


--
-- Name: cams_resource_emp_mapping_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_resource_emp_mapping
    ADD CONSTRAINT cams_resource_emp_mapping_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: cams_resource_emp_mapping_module_resource_mapping_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_resource_emp_mapping
    ADD CONSTRAINT cams_resource_emp_mapping_module_resource_mapping_id_fkey FOREIGN KEY (module_resource_mapping_id) REFERENCES cams_module_resource_mapping(module_resource_mapping_id);


--
-- Name: cams_site_deparment_mapping_dept_head_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_site_deparment_mapping
    ADD CONSTRAINT cams_site_deparment_mapping_dept_head_fkey FOREIGN KEY (dept_head) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: cams_site_deparment_mapping_dept_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_site_deparment_mapping
    ADD CONSTRAINT cams_site_deparment_mapping_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES cams_department_master(dept_id);


--
-- Name: cams_site_deparment_mapping_site_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_site_deparment_mapping
    ADD CONSTRAINT cams_site_deparment_mapping_site_id_fkey FOREIGN KEY (site_id) REFERENCES cams_site_master(site_id);


--
-- Name: cams_site_department_designation_group_mapping_dept_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_site_department_designation_group_mapping
    ADD CONSTRAINT cams_site_department_designation_group_mapping_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES cams_department_master(dept_id);


--
-- Name: cams_site_department_designation_group_mapping_desig_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_site_department_designation_group_mapping
    ADD CONSTRAINT cams_site_department_designation_group_mapping_desig_id_fkey FOREIGN KEY (desig_id) REFERENCES cams_designation_master(desig_id);


--
-- Name: cams_site_department_designation_group_mapping_group_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_site_department_designation_group_mapping
    ADD CONSTRAINT cams_site_department_designation_group_mapping_group_id_fkey FOREIGN KEY (group_id) REFERENCES cams_group_master(group_id);


--
-- Name: cams_site_department_designation_group_mapping_site_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_site_department_designation_group_mapping
    ADD CONSTRAINT cams_site_department_designation_group_mapping_site_id_fkey FOREIGN KEY (site_id) REFERENCES cams_site_master(site_id);


--
-- Name: cams_tab_designation_mapping_desig_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_tab_designation_mapping
    ADD CONSTRAINT cams_tab_designation_mapping_desig_id_fkey FOREIGN KEY (desig_id) REFERENCES cams_designation_master(desig_id);


--
-- Name: cams_tab_designation_mapping_tab_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_tab_designation_mapping
    ADD CONSTRAINT cams_tab_designation_mapping_tab_id_fkey FOREIGN KEY (tab_id) REFERENCES cams_tab_master(tab_id);


--
-- Name: cams_user_task_assignes_task_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY cams_user_task_assignes
    ADD CONSTRAINT cams_user_task_assignes_task_id_fkey FOREIGN KEY (task_id) REFERENCES cams_user_task(id);


--
-- Name: fk9712386fa10e27c1; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_hr_training
    ADD CONSTRAINT fk9712386fa10e27c1 FOREIGN KEY (training_id) REFERENCES wfcm_hr_department_trainer_mapping(hr_department_trainer_mapping_id);


--
-- Name: fkey_dept_id; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_hr_dept_training
    ADD CONSTRAINT fkey_dept_id FOREIGN KEY (dept_id) REFERENCES cams_department_master(dept_id);


--
-- Name: fkey_emp_id; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_hr_dept_training
    ADD CONSTRAINT fkey_emp_id FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: fktaskid; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_hr_dept_training
    ADD CONSTRAINT fktaskid FOREIGN KEY (task_id) REFERENCES cams_user_task(id) MATCH FULL;


--
-- Name: hr_training_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_hr_training
    ADD CONSTRAINT hr_training_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: site_id; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_hr_department_trainer_mapping
    ADD CONSTRAINT site_id FOREIGN KEY (site_id) REFERENCES cams_site_master(site_id);


--
-- Name: tni_image_master_tni_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_image_master
    ADD CONSTRAINT tni_image_master_tni_id_fkey FOREIGN KEY (tni_id) REFERENCES wfcm_tni_master(tni_id);


--
-- Name: wfcm_adhoc_training_document_master_training_topic_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_adhoc_training_document_master
    ADD CONSTRAINT wfcm_adhoc_training_document_master_training_topic_id_fkey FOREIGN KEY (training_topic_id) REFERENCES wfcm_adhoc_training_topic_master(training_topic_id);


--
-- Name: wfcm_adhoc_training_employee_result_deta_adhoc_training_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_adhoc_training_employee_result_details
    ADD CONSTRAINT wfcm_adhoc_training_employee_result_deta_adhoc_training_id_fkey FOREIGN KEY (adhoc_training_id) REFERENCES wfcm_adhoc_training_master(adhoc_training_id);


--
-- Name: wfcm_adhoc_training_master_training_topic_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_adhoc_training_master
    ADD CONSTRAINT wfcm_adhoc_training_master_training_topic_id_fkey FOREIGN KEY (training_topic_id) REFERENCES wfcm_adhoc_training_topic_master(training_topic_id);


--
-- Name: wfcm_emp_sop_training_maping_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_emp_sop_training_maping
    ADD CONSTRAINT wfcm_emp_sop_training_maping_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: wfcm_emp_sop_training_maping_sop_training_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_emp_sop_training_maping
    ADD CONSTRAINT wfcm_emp_sop_training_maping_sop_training_id_fkey FOREIGN KEY (sop_training_id) REFERENCES wfcm_sop_training_master(sop_training_id);


--
-- Name: wfcm_emp_tni_trainer_mapping_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_emp_tni_trainer_mapping
    ADD CONSTRAINT wfcm_emp_tni_trainer_mapping_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: wfcm_emp_tni_trainer_mapping_tni_sub_category_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_emp_tni_trainer_mapping
    ADD CONSTRAINT wfcm_emp_tni_trainer_mapping_tni_sub_category_id_fkey FOREIGN KEY (tni_sub_category_id) REFERENCES wfcm_tni_sub_catagory_master(tni_sub_category_id);


--
-- Name: wfcm_emp_tni_trainer_mapping_trainer_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_emp_tni_trainer_mapping
    ADD CONSTRAINT wfcm_emp_tni_trainer_mapping_trainer_id_fkey FOREIGN KEY (trainer_id) REFERENCES wfcm_trainer_master(trainer_id);


--
-- Name: wfcm_emp_training_attendance_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_emp_training_attendance
    ADD CONSTRAINT wfcm_emp_training_attendance_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: wfcm_emp_training_attendance_sop_training_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_emp_training_attendance
    ADD CONSTRAINT wfcm_emp_training_attendance_sop_training_id_fkey FOREIGN KEY (sop_training_id) REFERENCES wfcm_sop_training_master(sop_training_id);


--
-- Name: wfcm_employe_jd_mapping_jobdescription_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_employe_jd_mapping
    ADD CONSTRAINT wfcm_employe_jd_mapping_jobdescription_id_fkey FOREIGN KEY (jobdescription_id) REFERENCES wfcm_employee_jobdescription(jobdescription_id);


--
-- Name: wfcm_employee_sop_mapping_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_employee_sop_mapping
    ADD CONSTRAINT wfcm_employee_sop_mapping_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: wfcm_employee_sop_mapping_sop_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_employee_sop_mapping
    ADD CONSTRAINT wfcm_employee_sop_mapping_sop_id_fkey FOREIGN KEY (sop_id) REFERENCES wfcm_sop_master(sop_id);


--
-- Name: wfcm_employee_tni_training_mapping_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_employee_tni_training_mapping
    ADD CONSTRAINT wfcm_employee_tni_training_mapping_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: wfcm_employee_tni_training_mapping_tni_trainig_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_employee_tni_training_mapping
    ADD CONSTRAINT wfcm_employee_tni_training_mapping_tni_trainig_id_fkey FOREIGN KEY (tni_trainig_id) REFERENCES wfcm_tni_training_master(tni_trainig_id);


--
-- Name: wfcm_employee_training_certificate_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_employee_training_certificate
    ADD CONSTRAINT wfcm_employee_training_certificate_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: wfcm_employee_training_certificate_hod_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_employee_training_certificate
    ADD CONSTRAINT wfcm_employee_training_certificate_hod_emp_id_fkey FOREIGN KEY (hod_emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: wfcm_function_department_mapping_function_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_function_department_mapping
    ADD CONSTRAINT wfcm_function_department_mapping_function_id_fkey FOREIGN KEY (function_id) REFERENCES wfcm_function_master(function_id);


--
-- Name: wfcm_function_emp_mapping_function_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_function_emp_mapping
    ADD CONSTRAINT wfcm_function_emp_mapping_function_id_fkey FOREIGN KEY (function_id) REFERENCES wfcm_function_master(function_id);


--
-- Name: wfcm_function_emp_mapping_function_justification_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_function_emp_mapping
    ADD CONSTRAINT wfcm_function_emp_mapping_function_justification_id_fkey FOREIGN KEY (function_justification_id) REFERENCES wfcm_function_justification(function_justification_id);


--
-- Name: wfcm_function_sop_mapping_function_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_function_sop_mapping
    ADD CONSTRAINT wfcm_function_sop_mapping_function_id_fkey FOREIGN KEY (function_id) REFERENCES wfcm_function_master(function_id);


--
-- Name: wfcm_function_sop_mapping_sop_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_function_sop_mapping
    ADD CONSTRAINT wfcm_function_sop_mapping_sop_id_fkey FOREIGN KEY (sop_id) REFERENCES wfcm_sop_master(sop_id);


--
-- Name: wfcm_function_sop_mapping_sop_id_fkey1; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_function_sop_mapping
    ADD CONSTRAINT wfcm_function_sop_mapping_sop_id_fkey1 FOREIGN KEY (sop_id) REFERENCES wfcm_sop_master(sop_id);


--
-- Name: wfcm_hr_department_trainer_mapping_trainer_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_hr_department_trainer_mapping
    ADD CONSTRAINT wfcm_hr_department_trainer_mapping_trainer_id_fkey FOREIGN KEY (trainer_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: wfcm_hr_dept_training_doc_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_hr_dept_training
    ADD CONSTRAINT wfcm_hr_dept_training_doc_id_fkey FOREIGN KEY (doc_id) REFERENCES cams_document_mstr(doc_id);


--
-- Name: wfcm_hr_dept_training_doc_id_fkey1; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_hr_dept_training
    ADD CONSTRAINT wfcm_hr_dept_training_doc_id_fkey1 FOREIGN KEY (doc_id) REFERENCES cams_document_mstr(doc_id);


--
-- Name: wfcm_hr_dept_training_doc_id_fkey2; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_hr_dept_training
    ADD CONSTRAINT wfcm_hr_dept_training_doc_id_fkey2 FOREIGN KEY (doc_id) REFERENCES cams_document_mstr(doc_id);


--
-- Name: wfcm_hr_dept_training_doc_id_fkey3; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_hr_dept_training
    ADD CONSTRAINT wfcm_hr_dept_training_doc_id_fkey3 FOREIGN KEY (doc_id) REFERENCES cams_document_mstr(doc_id);


--
-- Name: wfcm_hr_dept_training_doc_id_fkey4; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_hr_dept_training
    ADD CONSTRAINT wfcm_hr_dept_training_doc_id_fkey4 FOREIGN KEY (doc_id) REFERENCES cams_document_mstr(doc_id);


--
-- Name: wfcm_job_responsiblities_jobdescription_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_job_responsiblities
    ADD CONSTRAINT wfcm_job_responsiblities_jobdescription_id_fkey FOREIGN KEY (jobdescription_id) REFERENCES wfcm_employee_jobdescription(jobdescription_id);


--
-- Name: wfcm_room_training_mapping_wfcm_room_training_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_room_training_mapping
    ADD CONSTRAINT wfcm_room_training_mapping_wfcm_room_training_id_fkey FOREIGN KEY (wfcm_room_training_id) REFERENCES wfcm_room_training(wfcm_room_training_id);


--
-- Name: wfcm_sop_approval_from_site_dept_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_approval
    ADD CONSTRAINT wfcm_sop_approval_from_site_dept_fkey FOREIGN KEY (from_site_dept) REFERENCES cams_site_deparment_mapping(site_dept_mpng_id);


--
-- Name: wfcm_sop_approval_sop_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_approval
    ADD CONSTRAINT wfcm_sop_approval_sop_id_fkey FOREIGN KEY (sop_id) REFERENCES wfcm_sop_master(sop_id);


--
-- Name: wfcm_sop_approval_to_site_dept_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_approval
    ADD CONSTRAINT wfcm_sop_approval_to_site_dept_fkey FOREIGN KEY (to_site_dept) REFERENCES cams_site_deparment_mapping(site_dept_mpng_id);


--
-- Name: wfcm_sop_blocked_test_sop_training_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_blocked_test
    ADD CONSTRAINT wfcm_sop_blocked_test_sop_training_id_fkey FOREIGN KEY (sop_training_id) REFERENCES wfcm_sop_training_master(sop_training_id);


--
-- Name: wfcm_sop_blocked_test_task_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_blocked_test
    ADD CONSTRAINT wfcm_sop_blocked_test_task_id_fkey FOREIGN KEY (task_id) REFERENCES cams_user_task(id);


--
-- Name: wfcm_sop_blocked_testr_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_blocked_test
    ADD CONSTRAINT wfcm_sop_blocked_testr_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: wfcm_sop_category_mapping_sop_category_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_category_mapping
    ADD CONSTRAINT wfcm_sop_category_mapping_sop_category_id_fkey FOREIGN KEY (sop_category_id) REFERENCES wfcm_sop_category_master(sop_category_id);


--
-- Name: wfcm_sop_category_mapping_sop_version_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_category_mapping
    ADD CONSTRAINT wfcm_sop_category_mapping_sop_version_id_fkey FOREIGN KEY (sop_version_id) REFERENCES wfcm_sop_version(sop_version_id);


--
-- Name: wfcm_sop_department_mapping_dept_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_department_mapping
    ADD CONSTRAINT wfcm_sop_department_mapping_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES cams_department_master(dept_id);


--
-- Name: wfcm_sop_department_mapping_dept_id_fkey1; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_department_mapping
    ADD CONSTRAINT wfcm_sop_department_mapping_dept_id_fkey1 FOREIGN KEY (dept_id) REFERENCES cams_department_master(dept_id);


--
-- Name: wfcm_sop_department_mapping_dept_id_fkey2; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_department_mapping
    ADD CONSTRAINT wfcm_sop_department_mapping_dept_id_fkey2 FOREIGN KEY (dept_id) REFERENCES cams_department_master(dept_id);


--
-- Name: wfcm_sop_department_mapping_sop_version_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_department_mapping
    ADD CONSTRAINT wfcm_sop_department_mapping_sop_version_id_fkey FOREIGN KEY (sop_version_id) REFERENCES wfcm_sop_version(sop_version_id);


--
-- Name: wfcm_sop_department_mapping_sop_version_id_fkey1; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_department_mapping
    ADD CONSTRAINT wfcm_sop_department_mapping_sop_version_id_fkey1 FOREIGN KEY (sop_version_id) REFERENCES wfcm_sop_version(sop_version_id);


--
-- Name: wfcm_sop_department_mapping_sop_version_id_fkey2; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_department_mapping
    ADD CONSTRAINT wfcm_sop_department_mapping_sop_version_id_fkey2 FOREIGN KEY (sop_version_id) REFERENCES wfcm_sop_version(sop_version_id);


--
-- Name: wfcm_sop_image_master_sop_version_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_image_master
    ADD CONSTRAINT wfcm_sop_image_master_sop_version_id_fkey FOREIGN KEY (sop_version_id) REFERENCES wfcm_sop_version(sop_version_id);


--
-- Name: wfcm_sop_question_master_sop_version_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_question_master
    ADD CONSTRAINT wfcm_sop_question_master_sop_version_id_fkey FOREIGN KEY (sop_version_id) REFERENCES wfcm_sop_version(sop_version_id);


--
-- Name: wfcm_sop_question_option_mapping_sop_question_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_question_option_mapping
    ADD CONSTRAINT wfcm_sop_question_option_mapping_sop_question_id_fkey FOREIGN KEY (sop_question_id) REFERENCES wfcm_sop_question_master(sop_question_id);


--
-- Name: wfcm_sop_site_department_group_mapping_dept_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_site_department_group_mapping
    ADD CONSTRAINT wfcm_sop_site_department_group_mapping_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES cams_department_master(dept_id);


--
-- Name: wfcm_sop_site_department_group_mapping_group_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_site_department_group_mapping
    ADD CONSTRAINT wfcm_sop_site_department_group_mapping_group_id_fkey FOREIGN KEY (group_id) REFERENCES cams_group_master(group_id);


--
-- Name: wfcm_sop_site_department_group_mapping_site_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_site_department_group_mapping
    ADD CONSTRAINT wfcm_sop_site_department_group_mapping_site_id_fkey FOREIGN KEY (site_id) REFERENCES cams_site_master(site_id);


--
-- Name: wfcm_sop_site_department_group_mapping_sop_version_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_site_department_group_mapping
    ADD CONSTRAINT wfcm_sop_site_department_group_mapping_sop_version_id_fkey FOREIGN KEY (sop_version_id) REFERENCES wfcm_sop_version(sop_version_id);


--
-- Name: wfcm_sop_status_handler_sop_version_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_status_handler
    ADD CONSTRAINT wfcm_sop_status_handler_sop_version_id_fkey FOREIGN KEY (sop_version_id) REFERENCES wfcm_sop_version(sop_version_id);


--
-- Name: wfcm_sop_status_handler_sop_version_id_fkey1; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_status_handler
    ADD CONSTRAINT wfcm_sop_status_handler_sop_version_id_fkey1 FOREIGN KEY (sop_version_id) REFERENCES wfcm_sop_version(sop_version_id);


--
-- Name: wfcm_sop_status_handler_task_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_status_handler
    ADD CONSTRAINT wfcm_sop_status_handler_task_id_fkey FOREIGN KEY (task_id) REFERENCES cams_user_task(id);


--
-- Name: wfcm_sop_status_handler_task_id_fkey1; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_status_handler
    ADD CONSTRAINT wfcm_sop_status_handler_task_id_fkey1 FOREIGN KEY (task_id) REFERENCES cams_user_task(id);


--
-- Name: wfcm_sop_test_data_sop_question_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_test_data
    ADD CONSTRAINT wfcm_sop_test_data_sop_question_id_fkey FOREIGN KEY (sop_question_id) REFERENCES wfcm_sop_question_master(sop_question_id);


--
-- Name: wfcm_sop_test_data_sop_test_data_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_test_data
    ADD CONSTRAINT wfcm_sop_test_data_sop_test_data_id_fkey FOREIGN KEY (sop_test_data_id) REFERENCES wfcm_sop_test(sop_test_id);


--
-- Name: wfcm_sop_test_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_test
    ADD CONSTRAINT wfcm_sop_test_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: wfcm_sop_test_sop_training_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_test
    ADD CONSTRAINT wfcm_sop_test_sop_training_id_fkey FOREIGN KEY (sop_training_id) REFERENCES wfcm_sop_training_master(sop_training_id);


--
-- Name: wfcm_sop_test_sop_version_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_test
    ADD CONSTRAINT wfcm_sop_test_sop_version_id_fkey FOREIGN KEY (sop_version_id) REFERENCES wfcm_sop_version(sop_version_id);


--
-- Name: wfcm_sop_training_master_sop_version_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_training_master
    ADD CONSTRAINT wfcm_sop_training_master_sop_version_id_fkey FOREIGN KEY (sop_version_id) REFERENCES wfcm_sop_version(sop_version_id);


--
-- Name: wfcm_sop_version_sop_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_sop_version
    ADD CONSTRAINT wfcm_sop_version_sop_id_fkey FOREIGN KEY (sop_id) REFERENCES wfcm_sop_master(sop_id);


--
-- Name: wfcm_tni_category_mapping_tni_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_category_mapping
    ADD CONSTRAINT wfcm_tni_category_mapping_tni_id_fkey FOREIGN KEY (tni_id) REFERENCES wfcm_tni_master(tni_id);


--
-- Name: wfcm_tni_category_mapping_tni_sub_category_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_category_mapping
    ADD CONSTRAINT wfcm_tni_category_mapping_tni_sub_category_id_fkey FOREIGN KEY (tni_sub_category_id) REFERENCES wfcm_tni_sub_catagory_master(tni_sub_category_id);


--
-- Name: wfcm_tni_question_master_tni_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_question_master
    ADD CONSTRAINT wfcm_tni_question_master_tni_id_fkey FOREIGN KEY (tni_id) REFERENCES wfcm_tni_master(tni_id);


--
-- Name: wfcm_tni_question_option_mapping_tni_question_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_question_option_mapping
    ADD CONSTRAINT wfcm_tni_question_option_mapping_tni_question_id_fkey FOREIGN KEY (tni_question_id) REFERENCES wfcm_tni_question_master(tni_question_id);


--
-- Name: wfcm_tni_site_department_designation_mapping_dept_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_site_department_designation_mapping
    ADD CONSTRAINT wfcm_tni_site_department_designation_mapping_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES cams_department_master(dept_id);


--
-- Name: wfcm_tni_site_department_designation_mapping_desig_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_site_department_designation_mapping
    ADD CONSTRAINT wfcm_tni_site_department_designation_mapping_desig_id_fkey FOREIGN KEY (desig_id) REFERENCES cams_designation_master(desig_id);


--
-- Name: wfcm_tni_site_department_designation_mapping_site_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_site_department_designation_mapping
    ADD CONSTRAINT wfcm_tni_site_department_designation_mapping_site_id_fkey FOREIGN KEY (site_id) REFERENCES cams_site_master(site_id);


--
-- Name: wfcm_tni_site_department_designation_mapping_tni_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_site_department_designation_mapping
    ADD CONSTRAINT wfcm_tni_site_department_designation_mapping_tni_id_fkey FOREIGN KEY (tni_id) REFERENCES wfcm_tni_master(tni_id);


--
-- Name: wfcm_tni_sub_catagory_master_tni_category_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_sub_catagory_master
    ADD CONSTRAINT wfcm_tni_sub_catagory_master_tni_category_id_fkey FOREIGN KEY (tni_category_id) REFERENCES wfcm_tni_category_master(tni_category_id);


--
-- Name: wfcm_tni_sub_category_emp_mapping_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_sub_category_emp_mapping
    ADD CONSTRAINT wfcm_tni_sub_category_emp_mapping_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: wfcm_tni_sub_category_emp_mapping_tni_sub_category_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_sub_category_emp_mapping
    ADD CONSTRAINT wfcm_tni_sub_category_emp_mapping_tni_sub_category_id_fkey FOREIGN KEY (tni_sub_category_id) REFERENCES wfcm_tni_sub_catagory_master(tni_sub_category_id);


--
-- Name: wfcm_tni_test_data_tni_question_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_test_data
    ADD CONSTRAINT wfcm_tni_test_data_tni_question_id_fkey FOREIGN KEY (tni_question_id) REFERENCES wfcm_tni_question_master(tni_question_id);


--
-- Name: wfcm_tni_test_data_tni_test_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_test_data
    ADD CONSTRAINT wfcm_tni_test_data_tni_test_id_fkey FOREIGN KEY (tni_test_id) REFERENCES wfcm_tni_test(tni_test_id);


--
-- Name: wfcm_tni_test_emp_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_test
    ADD CONSTRAINT wfcm_tni_test_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES cams_employee_mstr(emp_id);


--
-- Name: wfcm_tni_test_tni_training_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_test
    ADD CONSTRAINT wfcm_tni_test_tni_training_id_fkey FOREIGN KEY (tni_training_id) REFERENCES wfcm_tni_training_master(tni_trainig_id);


--
-- Name: wfcm_tni_trainer_subcategory_ma_emp_tni_trainer_mapping_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_trainer_subcategory_mapping
    ADD CONSTRAINT wfcm_tni_trainer_subcategory_ma_emp_tni_trainer_mapping_id_fkey FOREIGN KEY (emp_tni_trainer_mapping_id) REFERENCES wfcm_emp_tni_trainer_mapping(emp_tni_trainer_mapping_id);


--
-- Name: wfcm_tni_trainer_subcategory_mapping_tni_sub_catagory_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_trainer_subcategory_mapping
    ADD CONSTRAINT wfcm_tni_trainer_subcategory_mapping_tni_sub_catagory_id_fkey FOREIGN KEY (tni_sub_catagory_id) REFERENCES wfcm_tni_sub_catagory_master(tni_sub_category_id);


--
-- Name: wfcm_tni_training_master_tni_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_tni_training_master
    ADD CONSTRAINT wfcm_tni_training_master_tni_id_fkey FOREIGN KEY (tni_id) REFERENCES wfcm_tni_master(tni_id);


--
-- Name: wfcm_trainer_certificate_certificate_doc_id_fkey; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_trainer_certificate
    ADD CONSTRAINT wfcm_trainer_certificate_certificate_doc_id_fkey FOREIGN KEY (certificate_doc_id) REFERENCES cams_document_mstr(doc_id);


--
-- Name: wfcm_trainer_certificate_certificate_doc_id_fkey1; Type: FK CONSTRAINT; Schema: camsdb; Owner: cams
--

ALTER TABLE ONLY wfcm_trainer_certificate
    ADD CONSTRAINT wfcm_trainer_certificate_certificate_doc_id_fkey1 FOREIGN KEY (certificate_doc_id) REFERENCES cams_document_mstr(doc_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

