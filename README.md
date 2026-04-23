# Node.js Express + Neon DB Demo

This is a minimalist Node.js application designed for technical demos. It features simple session-based authentication (with encrypted passwords using `bcryptjs`) and a protected dashboard that fetches data from a PostgreSQL database hosted on [Neon.tech](https://neon.tech).

## Deployment Guide (Render.com + Neon.tech)

Follow these steps to deploy this project for free.

### 1. Database Setup (Neon.tech)
1. Sign up or log in to [Neon.tech](https://neon.tech).
2. Create a new project (select the region closest to you).
3. In the **SQL Editor**, copy and paste the contents of `setup.sql` and run it. This will create the `users` and `items` tables and insert sample data.
4. Go to the **Dashboard** and copy your **Connection String**. It should look like this:
   `postgres://user:password@ep-cool-name-123456.us-east-2.aws.neon.tech/neondb?sslmode=require`

### 2. Local Preparation
1. Create a `.env` file in the `nodejs-demo` folder (copy from `.env.example`).
2. Paste your Neon connection string into `DATABASE_URL`.
3. Set a `SESSION_SECRET` (e.g., `mysecret123`).
4. Run `npm install` and then `npm start` to test locally at `http://localhost:3000`.

### 3. Deploy to Render.com
1. Push this code to a GitHub repository.
2. Log in to [Render.com](https://render.com).
3. Click **New +** and select **Web Service**.
4. Connect your GitHub repository.
5. Configure the service:
   - **Name**: `tech-demo-app` (or your choice)
   - **Runtime**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Instance Type**: Select **Free**
6. Click **Advanced** and add the following **Environment Variables**:
   - `DATABASE_URL`: (Your Neon Connection String)
   - `SESSION_SECRET`: (A random string)
   - `NODE_ENV`: `production`
7. Click **Create Web Service**.

### 4. Verification
- Once the deployment is finished, open the provided URL.
- Login with:
  - **Username**: `admin`
  - **Password**: `password123`
- You should see the items fetched from your Neon database on the dashboard!

---
**Note**: Since this is on Render's Free Tier, the service may "spin down" after inactivity. The first request after a break might take ~30-60 seconds to start up.
