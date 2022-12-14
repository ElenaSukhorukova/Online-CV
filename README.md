<h1>Online CV</h1>

<p>This application can hepl to create an interactive сurriculum vitae where a user can add next data abour himself:</p>
	<ul>
		<li>Contacts</li>
		<li>Education</li>
		<li>Experience with duties and achievements</li>
		<li>Courses</li>
		<li>Personal data as a title, a position,full name, about and photo.</li>
		<li>Projects</li>
		<li>Skills with sources where a certain skill was received.</li>
	</ul>

<p>The user has an opportunity to create only one profile and get access to an admin page. On the admin page User can add personal data using two languages: English and Russian. The user can change language the application and see data in the chosen language. The last writing of Contacts and Personal data will be shown and all other wiriting will be added as a list.</p>
<p>To get an access to sign up/sign in buttons the user should click a reference on the footer 'I am an owner of this site'</p>
<p>The user should tune mailer in config/environments to confirm his mail or shut down confirmable in user's model.</p>

<h5> An example working of the application you can see on my own Online CV https://onlinecv.onrender.com/</h5>
<hr />
<p>You can install and use the application via the next instruction:</p>

<ol>
	<li>Run in the command line <code>git clone https://github.com/ElenaSukhorukova/Online_CV.git</code></li>
	<li>Run <code>bundle install</code></li>
	<li>
		Write down in <code>config/application.yml</code> next constants:
		<ul>
		  <li>DATA_BASE_NAME: your_db_name</li>
		  <li>DATA_BASE_PASSWORD: your_db_password</li>
		  <li>MAILER_USER_NAME: your_mailer</li>
		  <li>MAILER_PASSWORD: !! for google it is security password for applications !!</li>
	 	</ul>
	 </li>
	<li>Install <b>ImageMagick</b> https://imagemagick.org/ for ActiveStorage. You should has AWS S3 and IAM user. See a perfect instraction here <a href='https://www.youtube.com/watch?v=tRRnV67bK9c&ab_channel=SupeRailsbyYaroslavShmarov'>Ruby on Rails #20 ActiveStorage</a></li>
	<li>
		If you run app in Unix system you should tune postgresql. The next way helped me to escape an error <b>"connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: FATAL:  password authentication failed for user "postgres""</b>
		<ul>
			<li>run <code>sudo nano /etc/postgresql/15/main/pg_ident.conf</code>. Add <b>user2 your_unix_yser postgres</b></li>
			<li>run <code>sudo nano /etc/postgresql/15/main/pg_hba.conf</code>. Add <b>local  all  all  peer</b></li>
			<li>run <code>sudo service postgresql start</code></li>
		</ul>
  	</li>
  	<li>Run <code>rails db:schema:load</code></li>
  	<li>Open http://localhost:3000/</li>
 </ol>

<b>
	<p>Now I am lookin for a possition of RoR developer. If can help me, please, connect to me via one of this ways:</p>
	<p>LinkedIn: https://www.linkedin.com/in/elenasukhorukova/</p>
	<p>Telegram: https://t.me/elenkasu</p>
	<p>Email: <a href="mailto:suhorukova.el@gmail.com">suhorukova.el@gmail.com</a></p>
</b>
