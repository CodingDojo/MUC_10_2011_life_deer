using System.Collections.Generic;
using System;

public class Untitled
{}

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
    
    public bool IsAlive(int position)
    {
        if (this.Cells == null) return false;
        
        if (position < 0) return false;
        
        if (position > this.Cells.Count) return false;
        
        return this.Cells[position -1];
    }

    public bool GetNeighborNW(int position)
    {
        return IsAlive(position - this.Witdh - 1)
    }

    public bool GetNeighborN(int position)
    {
        return IsAlive(position - this.Witdh)
    }
}

