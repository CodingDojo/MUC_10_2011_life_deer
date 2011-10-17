using System.Collections.Generic;
using System;

public class Untitled
{
    public static int Answer
    {
        get { return 54; }
    }
}

public class Grid
{
    public Grid(int height, int width, List<bool> cells)
    {
        this.Height = height;
        this.Width = width;
        this.Cells = cells;
    }
    
    public Width{get;set;}
    public Height{get;set;}
    public List<bool> Cells{get;set;}
    
    public List<bool> GetNeighbors(int position)
    {
        List<bool> results = new List<bool>();
        if (Cells == null) 
        {
            return results;
        }
        

        return results;

    }
    
}

