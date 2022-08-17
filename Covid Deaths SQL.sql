Select *
From PortfolioProjects..CovidDeaths
order by 3,4

-- Select Data that we are going to be using
Select Location, date, total_cases, new_cases, total_deaths, population 
From PortfolioProjects..CovidDeaths
Order by 1,2 

--Looking at Total Cases vs Total Deaths 
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage 
From PortfolioProjects..CovidDeaths
Order by 1,2 

-- Show likelihood of dying if you contract covid in your country
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage 
From PortfolioProjects..CovidDeaths
where location like '%Egypt%'
Order by 1,2 

-- Looking at Total cases vs population  
-- Show what percentage of population got covid

Select Location, date, total_cases, population, (total_cases/population)*100 as PopulationPercentage 
From PortfolioProjects..CovidDeaths
where location like '%states%'
Order by 1,2 


-- Looking at countries has highst infection reat compered to population  
Select Location, population, MAX(total_cases) as HighstInfuctionCount,MAX((total_cases/population))*100 as 
  PercentPopulationInfected 
From PortfolioProjects..CovidDeaths
Group by location, population
Order by PercentPopulationInfected desc 


-- Show counries with highest death count per population
 
Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProjects..CovidDeaths
Where continent is not null 
Group by Location
order by TotalDeathCount desc


-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProjects..CovidDeaths
--Where location like '%states%'
Where continent is not null 
Group by continent
order by TotalDeathCount desc


-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProjects..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2