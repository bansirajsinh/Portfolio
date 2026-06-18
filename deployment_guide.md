# How to Make Your Website Live on the Internet (Free of Cost)

Welcome! Making a website live on the internet means taking the files on your computer and putting them on a special computer called a "Server" that is always on and connected to the internet. 

Since your project has three main parts, we will need to host them in three different places:
1. **Frontend (HTML/CSS/JS):** The visual part of your website.
2. **Backend (Node.js API):** The brain that handles logic, emails, etc.
3. **Database (MySQL):** Where your data (like projects, skills) is stored.

Don't worry, we will do this step-by-step for a beginner, entirely for **free**.

---

## Step 1: Prepare Your Code for the Internet (GitHub)
Before hosting, we need to upload your code to GitHub. GitHub is a safe place to store your code online, and hosting providers will pull your code directly from there.

1. **Create a GitHub Account:** Go to [GitHub.com](https://github.com/) and sign up.
2. **Download GitHub Desktop:** If you don't know Git commands, download [GitHub Desktop](https://desktop.github.com/).
3. **Create a Repository:**
   - Open GitHub Desktop, sign in.
   - Go to `File > Add Local Repository` and select your `Portfolio` folder.
   - Click `Publish repository` to send it to GitHub. Make sure it's set to "Public" (or "Private" if you prefer, but Public is easier for free hosting sometimes).

---

## Step 2: Host Your Database (Free MySQL)
Your code currently runs MySQL on your own computer. We need a free MySQL database on the internet. We will use **Aiven** (they provide a free MySQL plan).

1. Go to [Aiven.io](https://aiven.io/) and create a free account.
2. Click **Create Service** and choose **MySQL**.
3. Select the **Free Plan** (Hobbyist).
4. Choose a region close to you and click Create.
5. Once it's running, you will see the **Connection Details** (Host, Port, User, Password, Database Name). 
6. Keep this page open; you will need these details for Step 3.

---

## Step 3: Host Your Backend (Render.com)
The backend (Node.js) needs a server to run. We will use **Render**, which is great for beginners and has a free tier.

1. Go to [Render.com](https://render.com/) and sign up using your GitHub account.
2. Click on **New +** and select **Web Service**.
3. Connect your GitHub account and select your `Portfolio` repository.
4. **Configuration:**
   - **Name:** `portfolio-backend` (or anything you like).
   - **Root Directory:** Type `backend` (since your backend code is in the backend folder).
   - **Environment:** `Node`
   - **Build Command:** `npm install`
   - **Start Command:** `node app.js`
   - **Instance Type:** Select the **Free** option.
5. **Environment Variables:** Scroll down to "Environment Variables" and add these keys (from your Aiven Database details):
   - `DB_HOST`: (Paste Aiven Host here)
   - `DB_USER`: (Paste Aiven User here)
   - `DB_PASSWORD`: (Paste Aiven Password here)
   - `DB_NAME`: (Paste Aiven Database Name here)
   - `DB_PORT`: (Paste Aiven Port here, usually something like 10000+ on Aiven)
   - `PORT`: `10000`
   - `EMAIL_USER`: Your Gmail address
   - `EMAIL_PASS`: Your Gmail App Password
6. Click **Create Web Service**. It will take a few minutes to build. Once done, Render will give you a URL like `https://portfolio-backend-xyz.onrender.com`. Save this URL!

---

## Step 4: Update Frontend to use Live Backend
Right now, your frontend (`api.js` or similar files) is trying to talk to `http://localhost:3000`. You need to change this to your new Render URL so your website can talk to your live backend.

1. Open your code in your editor.
2. Go to `js/api.js` (or wherever your API calls are made).
3. Find the line that says `http://localhost:3000` and change it to your new Render URL (e.g., `https://portfolio-backend-xyz.onrender.com`).
4. **Commit and Push:** Go to GitHub Desktop, write a summary like "Updated API URL", commit, and push to GitHub.

---

## Step 5: Host Your Frontend (Netlify or Vercel)
Now we will host the HTML/CSS/JS files so people can actually see your site. We will use **Netlify**.

1. Go to [Netlify.com](https://www.netlify.com/) and sign up with your GitHub account.
2. Click **Add new site** > **Import an existing project**.
3. Select **GitHub** and choose your `Portfolio` repository.
4. **Configuration:**
   - **Base directory:** Leave it blank (or `/` if required).
   - **Build command:** Leave it blank (since it's just HTML/CSS/JS).
   - **Publish directory:** Leave it blank (or `/` if all HTML files are in the root, or type `.` to serve the whole folder).
5. Click **Deploy Site**.
6. Netlify will generate a live link for you (like `https://happy-cat-123.netlify.app`). You can change this name in the "Site Settings" to something like `bansirajsinh-portfolio.netlify.app`.

---

## Step 6: Set Up Your Database Tables (The Seed)
Your live Aiven database is currently empty. You need to create the tables.
1. Download a free tool called **DBeaver** or **MySQL Workbench** on your computer.
2. Connect to your Aiven database using the Host, Port, Username, and Password from Aiven.
3. Once connected, open a new SQL script.
4. Copy the contents of your `schema.sql` and `seed.sql` files from your code, paste them into the tool, and run them.
5. This will create all your tables (Projects, Skills, etc.) on the live database!

---

## 🎉 Congratulations!
Your website is now LIVE on the internet! 
- Go to your Netlify link to see your website.
- It will talk to your Render backend safely.
- The Render backend will pull data from your Aiven database.

**Summary of Links:**
- Frontend: `https://your-name.netlify.app`
- Backend: `https://your-backend.onrender.com`
- Database: Hosted on Aiven.

If you get stuck on any step when you actually try this, just ask me and I will help you troubleshoot it!
