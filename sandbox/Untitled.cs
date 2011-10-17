using System.Collections.Generic;
using System;

public class Grid
{
    public Grid(int height, int width, List<bool> cells)
    {
        this.Height = height;
        this.Width = width;
        this.Cells = cells;
    }
    
    public int Width {get;set;}
    public int Height {get;set;}
    public List<bool> Cells {get;set;}
    
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

