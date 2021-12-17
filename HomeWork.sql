CREATE TABLE public.payment
(
    paymentID integer,
    email character varying(25),
    time DATE NOT NULL DEFAULT CURRENT_DATE,
	amount integer,
    PRIMARY KEY (paymentID)
);

CREATE TABLE public.WorkOut
(
    WorkOutId integer,
    type character varying(25),
    PRIMARY KEY (type)
);

CREATE TABLE public.Trainer
(
    TrainerId integer,
    name character varying(25),
	email character varying(25),
	contact integer,
    PRIMARY KEY (name)
);


CREATE TABLE public.WorkOutPlan
(
	TrainerName character varying(25),
	WorkoutType character varying(25),
	date DATE NOT NULL DEFAULT CURRENT_DATE,
	PRIMARY KEY (TrainerName,WorkoutType),
		CONSTRAINT fk_Trainer
			FOREIGN KEY(TrainerName)
				references Trainer(name)
					on update cascade
	                on delete cascade,
		CONSTRAINT fk_WorkOut
			FOREIGN KEY(WorkoutType)
				references WorkOut(type)
					on update cascade
	                on delete cascade

)
	
insert into payment values
(100, 'b@h.edu.tr', '10-12-2021',500),
(101, 'ty6@g.com', '11-12-2021',600),
(102, 'gh@h.edu.tr', '12-12-2021',400),
(103, 'yu@g.com', '13-12-2021',300),
(104, 'a8@h.edu.tr', '14-12-2021',200),
(105, 'hg@h.edu.tr', '15-12-2021',400)	
	
insert into Trainer values
(1000, 'ayse', 'dasdsa@fds',545),
(1001, 'ali','ddfs@fds', 600),
(1002, 'veysel','ddfsfa@fds', 400),
(1003, 'melike','wederdsa@fds', 300),
(1004, 'furkan','detytdsa@fds', 200),
(1005, 'kerem', 'ytrhty@fds',405)

insert into WorkOut values
(1, 'swimming'),
(2, 'fitnees'),
(3, 'basketball'),
(4, 'footboll')


insert into WorkOutPlan values
('ayse','basketball', '10-12-2021'),
('ali','swimming', '10-12-2021'),
('veysel','fitnees', '10-12-2021'),
('melike','swimming', '10-12-2021'),
('furkan','fitnees', '10-12-2021'),
('kerem','footboll', '10-12-2021')


select * from payment
select * from trainer
select * from WorkOutPlan

