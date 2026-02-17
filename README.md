# SkillForge - Business Education Platform

ASP.NET web application for professional business certifications.

## Features
- User registration and authentication
- Browse business modules (Leadership, Finance, Communication)
- Track learning progress
- Module quizzes with instant feedback
- PDF certificate generation
- Admin panel for content management

## Technologies
- ASP.NET Web Forms
- C# 
- SQL Server (LocalDB)
- HTML/CSS
- iTextSharp (PDF generation)

## Setup Instructions
1. Clone repository
2. Open `Assignment.sln` in Visual Studio
3. Update connection string in `Web.config` to match your database path
4. Install NuGet package: `Install-Package iTextSharp`
5. Run application (F5)

## Database
- `SkillForgeDB.mdf` included in `App_Data` folder
- Contains: Users, Modules, Articles, QuizQuestions, QuizAttempts, Certificates tables

## Pages
- `Default.aspx` - Homepage with business insights
- `Register.aspx` - User registration
- `ModuleDetail.aspx` - View module content and take quiz
- `Quiz.aspx` - Assessment with scoring
- `Certificate.aspx` - Generate and download PDF certificates
- `Profile.aspx` - User progress and badges
- `AdminModules.aspx` - Admin content management
- `About.aspx` - Company information
- `Contact.aspx` - Contact details

## Authors
- Kriti Chew Chia Shing
- Laashmita A/P K.Saravanan
- Nur Umairah Binti Ahmad Faizel
- Sara Elwalid Hassan Fagir 

## Institution
Asia Pacific University (APU)
