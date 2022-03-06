PGDMP                           z            catalogo_libri    14.1    14.1 3    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    17319    catalogo_libri    DATABASE     j   CREATE DATABASE catalogo_libri WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Italian_Italy.1252';
    DROP DATABASE catalogo_libri;
                postgres    false            �            1259    35296    autore    TABLE     �   CREATE TABLE public.autore (
    id bigint NOT NULL,
    cognome character varying(255) NOT NULL,
    nome character varying(255) NOT NULL
);
    DROP TABLE public.autore;
       public         heap    postgres    false            �            1259    35295    autore_id_seq    SEQUENCE     v   CREATE SEQUENCE public.autore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.autore_id_seq;
       public          postgres    false    212            8           0    0    autore_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.autore_id_seq OWNED BY public.autore.id;
          public          postgres    false    211            �            1259    35305 	   categoria    TABLE     d   CREATE TABLE public.categoria (
    id bigint NOT NULL,
    nome character varying(255) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    35304    categoria_id_seq    SEQUENCE     y   CREATE SEQUENCE public.categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.categoria_id_seq;
       public          postgres    false    214            9           0    0    categoria_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;
          public          postgres    false    213            �            1259    35294    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public          postgres    false            �            1259    33604    libri_autore    TABLE     b   CREATE TABLE public.libri_autore (
    libri_id bigint NOT NULL,
    autore_id bigint NOT NULL
);
     DROP TABLE public.libri_autore;
       public         heap    postgres    false            �            1259    35311    libri_autori    TABLE     b   CREATE TABLE public.libri_autori (
    libri_id bigint NOT NULL,
    autore_id bigint NOT NULL
);
     DROP TABLE public.libri_autori;
       public         heap    postgres    false            �            1259    35316    libri_categorie    TABLE     h   CREATE TABLE public.libri_categorie (
    libri_id bigint NOT NULL,
    categoria_id bigint NOT NULL
);
 #   DROP TABLE public.libri_categorie;
       public         heap    postgres    false            �            1259    35322    libro    TABLE     �   CREATE TABLE public.libro (
    id bigint NOT NULL,
    anno_pubblicazione integer NOT NULL,
    prezzo double precision NOT NULL,
    titolo character varying(255) NOT NULL
);
    DROP TABLE public.libro;
       public         heap    postgres    false            �            1259    35321    libro_id_seq    SEQUENCE     u   CREATE SEQUENCE public.libro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.libro_id_seq;
       public          postgres    false    218            :           0    0    libro_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.libro_id_seq OWNED BY public.libro.id;
          public          postgres    false    217            �            1259    35328    role    TABLE     V   CREATE TABLE public.role (
    id bigint NOT NULL,
    name character varying(255)
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    35333 	   user_role    TABLE     \   CREATE TABLE public.user_role (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);
    DROP TABLE public.user_role;
       public         heap    postgres    false            �            1259    35338    user_spring    TABLE     �   CREATE TABLE public.user_spring (
    id bigint NOT NULL,
    email character varying(255),
    is_active boolean NOT NULL,
    password character varying(255),
    user_name character varying(255)
);
    DROP TABLE public.user_spring;
       public         heap    postgres    false                       2604    35299 	   autore id    DEFAULT     f   ALTER TABLE ONLY public.autore ALTER COLUMN id SET DEFAULT nextval('public.autore_id_seq'::regclass);
 8   ALTER TABLE public.autore ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    35308    categoria id    DEFAULT     l   ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);
 ;   ALTER TABLE public.categoria ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    35325    libro id    DEFAULT     d   ALTER TABLE ONLY public.libro ALTER COLUMN id SET DEFAULT nextval('public.libro_id_seq'::regclass);
 7   ALTER TABLE public.libro ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            (          0    35296    autore 
   TABLE DATA           3   COPY public.autore (id, cognome, nome) FROM stdin;
    public          postgres    false    212   �7       *          0    35305 	   categoria 
   TABLE DATA           -   COPY public.categoria (id, nome) FROM stdin;
    public          postgres    false    214   �7       %          0    33604    libri_autore 
   TABLE DATA           ;   COPY public.libri_autore (libri_id, autore_id) FROM stdin;
    public          postgres    false    209   ?8       +          0    35311    libri_autori 
   TABLE DATA           ;   COPY public.libri_autori (libri_id, autore_id) FROM stdin;
    public          postgres    false    215   e8       ,          0    35316    libri_categorie 
   TABLE DATA           A   COPY public.libri_categorie (libri_id, categoria_id) FROM stdin;
    public          postgres    false    216   �8       .          0    35322    libro 
   TABLE DATA           G   COPY public.libro (id, anno_pubblicazione, prezzo, titolo) FROM stdin;
    public          postgres    false    218   �8       /          0    35328    role 
   TABLE DATA           (   COPY public.role (id, name) FROM stdin;
    public          postgres    false    219   h9       0          0    35333 	   user_role 
   TABLE DATA           5   COPY public.user_role (user_id, role_id) FROM stdin;
    public          postgres    false    220   �9       1          0    35338    user_spring 
   TABLE DATA           P   COPY public.user_spring (id, email, is_active, password, user_name) FROM stdin;
    public          postgres    false    221   �9       ;           0    0    autore_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.autore_id_seq', 4, true);
          public          postgres    false    211            <           0    0    categoria_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.categoria_id_seq', 3, true);
          public          postgres    false    213            =           0    0    hibernate_sequence    SEQUENCE SET     @   SELECT pg_catalog.setval('public.hibernate_sequence', 4, true);
          public          postgres    false    210            >           0    0    libro_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.libro_id_seq', 4, true);
          public          postgres    false    217            �           2606    35303    autore autore_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.autore
    ADD CONSTRAINT autore_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.autore DROP CONSTRAINT autore_pkey;
       public            postgres    false    212            �           2606    35310    categoria categoria_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    214            �           2606    33608    libri_autore libri_autore_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.libri_autore
    ADD CONSTRAINT libri_autore_pkey PRIMARY KEY (libri_id, autore_id);
 H   ALTER TABLE ONLY public.libri_autore DROP CONSTRAINT libri_autore_pkey;
       public            postgres    false    209    209            �           2606    35315    libri_autori libri_autori_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.libri_autori
    ADD CONSTRAINT libri_autori_pkey PRIMARY KEY (libri_id, autore_id);
 H   ALTER TABLE ONLY public.libri_autori DROP CONSTRAINT libri_autori_pkey;
       public            postgres    false    215    215            �           2606    35320 $   libri_categorie libri_categorie_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.libri_categorie
    ADD CONSTRAINT libri_categorie_pkey PRIMARY KEY (libri_id, categoria_id);
 N   ALTER TABLE ONLY public.libri_categorie DROP CONSTRAINT libri_categorie_pkey;
       public            postgres    false    216    216            �           2606    35327    libro libro_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.libro DROP CONSTRAINT libro_pkey;
       public            postgres    false    218            �           2606    35332    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    219            �           2606    35337    user_role user_role_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);
 B   ALTER TABLE ONLY public.user_role DROP CONSTRAINT user_role_pkey;
       public            postgres    false    220    220            �           2606    35344    user_spring user_spring_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_spring
    ADD CONSTRAINT user_spring_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_spring DROP CONSTRAINT user_spring_pkey;
       public            postgres    false    221            �           2606    35365 %   user_role fka68196081fvovjhkek5m97n3y    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fka68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.user_role DROP CONSTRAINT fka68196081fvovjhkek5m97n3y;
       public          postgres    false    3215    220    219            �           2606    35355 +   libri_categorie fkgvwbrv6ng3291ms36csjbacrl    FK CONSTRAINT     �   ALTER TABLE ONLY public.libri_categorie
    ADD CONSTRAINT fkgvwbrv6ng3291ms36csjbacrl FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);
 U   ALTER TABLE ONLY public.libri_categorie DROP CONSTRAINT fkgvwbrv6ng3291ms36csjbacrl;
       public          postgres    false    214    3207    216            �           2606    35345 (   libri_autori fkihbnvnb6gi5ihakbto8w1u240    FK CONSTRAINT     �   ALTER TABLE ONLY public.libri_autori
    ADD CONSTRAINT fkihbnvnb6gi5ihakbto8w1u240 FOREIGN KEY (autore_id) REFERENCES public.autore(id);
 R   ALTER TABLE ONLY public.libri_autori DROP CONSTRAINT fkihbnvnb6gi5ihakbto8w1u240;
       public          postgres    false    215    212    3205            �           2606    35350 (   libri_autori fkiic0glikwfgnenqsq3ofp7muu    FK CONSTRAINT     �   ALTER TABLE ONLY public.libri_autori
    ADD CONSTRAINT fkiic0glikwfgnenqsq3ofp7muu FOREIGN KEY (libri_id) REFERENCES public.libro(id);
 R   ALTER TABLE ONLY public.libri_autori DROP CONSTRAINT fkiic0glikwfgnenqsq3ofp7muu;
       public          postgres    false    215    218    3213            �           2606    35370 %   user_role fkjnbh64dhuo55gh2jd9d21d245    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fkjnbh64dhuo55gh2jd9d21d245 FOREIGN KEY (user_id) REFERENCES public.user_spring(id);
 O   ALTER TABLE ONLY public.user_role DROP CONSTRAINT fkjnbh64dhuo55gh2jd9d21d245;
       public          postgres    false    221    3219    220            �           2606    35360 *   libri_categorie fkpvebd9fsdmceh2n9li1cdxw0    FK CONSTRAINT     �   ALTER TABLE ONLY public.libri_categorie
    ADD CONSTRAINT fkpvebd9fsdmceh2n9li1cdxw0 FOREIGN KEY (libri_id) REFERENCES public.libro(id);
 T   ALTER TABLE ONLY public.libri_categorie DROP CONSTRAINT fkpvebd9fsdmceh2n9li1cdxw0;
       public          postgres    false    218    216    3213            (   S   x��9�0�z�$�P�E
%�	)V2����a��:/"��Ve®���B�V#�2#�P��ݨ�e����tlOW�r"�S�U      *   6   x�3�t,-�O��O/JL�L�2���M̫��2�tK�+I,N�LͫJ����� e�r      %      x�3�4�2bc ����� (      +      x�3�4�2�4�2�4�2�4����� ��      ,      x�3�4�2�4�2�4�2�1z\\\ ��      .   �   x�M�1�0��99��@ՄJ(l���Ē�VeA�$H\���#����=�lo�2�sN]b��'�`ʔ����p�3��(Em+7���f*3G�}o��r�-��/QPo۝Ufh�1�������!Ŋ�~�~�!O(=��SiK�Nk���8�      /   !   x�3���q�wt����2�pB�]��b���� s��      0      x�3�4�2�4����� ��      1   �   x�m���   �3<�g�ֱ��_ڪE�B�fj������}��ESަ�mxyCYۀ'���mM(���f䘼�kU'�������U�r#]�>'�~(��+�� FK���jg��s�w��01����	|�^��*��X����5>�};xB���8W     