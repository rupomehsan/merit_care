<div>
    {{-- A good traveler has no fixed plans and is not intent upon arriving. --}}
    <section class="courses_area" id="course_area">
        <div class="container">


            <!-- courses_area_title start-->
            <div class="courses_area_title">
                <h2 class="heading_border_btm">Our Branches</h2>
            </div>
            <!-- courses_area_title end -->
            <div class="branch_area mb-5">
                <div class="row">
                    <table class="table" id="branch_table" style="z-index: -1;">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Coaching</th>
                                <th scope="col">Branch</th>
                                <th scope="col">Branch Code</th>
                                <th scope="col">Address</th>
                                <th scope="col">Mobile Number</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($branches as $key => $item)
                                <tr>
                                    <th>{{ $key + 1 }}</th>
                                    <th>{{ $item->coaching_name }}</th>
                                    <td>{{ $item->name }}</td>
                                    <td>{{ $item->branch_code }}</td>
                                    <td>{{ $item->street }}</td>
                                    <td>
                                        @foreach ($item->institute_branch_contact as $contact)
                                            {{-- <p class="card-text"><b>Name: </b>{{ $contact->first_name }} {{ $contact->last_name }}</p> --}}
                                            <div class="js-conveyor-branch">
                                                <ul>
                                                    <li>
                                                        <p><b><i class="fas fa-phone color_secondary"></i><span
                                                                    class="color_primary ps-1"></b>
                                                            {{ $contact->phone_number }}</p></span>
                                                    </li>
                                                </ul>
                                            </div>
                                        @endforeach
                                    </td>
                                    <td>
                                        <button onclick="ShowDetails({{ $item }})" type="button" class="btn btn-primary" data-bs-toggle="modal"
                                            data-bs-target="#exampleModal">View Details</button>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Branch details</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        {{-- <div class="text-center">

                        </div> --}}
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        function ShowDetails(branch) {
            // Access the modal body element
            var modalBody = document.querySelector('#exampleModal .modal-body');
    
            // Clear previous content
            modalBody.innerHTML = '';
    
            // Create HTML elements for text details
            var detailsHTML = `
                <p><strong>Name:</strong> ${branch.coaching_name}, ${branch.name}</p>
                <p><strong>Branch Code:</strong> ${branch.branch_code}</p>
                <p><strong>Address:</strong> ${branch.street}, ${branch.state}</p>
                <p><strong>Contact Numbers:</strong></p>
                <ul>`;
    
            branch.institute_branch_contact.forEach(contact => {
                detailsHTML += `<li>${contact.phone_number}</li>`;
            });
    
            detailsHTML += '</ul>';
    
            // Append text details to the modal body
            modalBody.innerHTML = detailsHTML;
    
            // Check if the map link is available
            if (branch.map_link) {
                // Add a map label
                modalBody.innerHTML += '<p><strong>Map:</strong></p>';

                // Append the map iframe HTML to the modal body
                modalBody.innerHTML += branch.map_link;

                                
                var iframe = document.querySelector('iframe');

                // Set the width to 100%
                if (iframe) {
                    iframe.style.width = '100%';
                }
            }
        }
    </script>
</div>
