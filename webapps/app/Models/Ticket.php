<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;
    protected  $table = "tickets";
    protected $fillable = [
        'user_id',
        'raised_by',
        'product_id',
        'organization_id',
        'approved',
        'title',
        'details',
        'ticket_code',
        'type',
        'priority',
        'url',
        'raising_date',
        'ticket_number',
        'related_ticket_id',
        'comment',
        'email_cc',
        'image',

    ];

    /**
     * Get the user that owns the Ticket
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
    public function status()
    {
        return $this->belongsTo(Status::class, 'status_id', 'id');
    }

    /**
     * Get all of the comments for the Ticket
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function images()
    {
        return $this->hasMany(TicketImage::class, 'ticket_id', 'id');
    }

}
